$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.upload-photo').on('submit', function(e){
  	e.preventDefault();
  	var path = $(this).attr('action')
  	console.log(path)
  	// var imageLink = $('.upload-photo input[type="text"]').val()
  	// console.log(imageLink)
  	var imagedata = $(this).serialize();
  	console.log(imagedata)
  	 $.ajax({
  		url: path,
  		type:"POST",
  		data: imagedata,
  		dataType: "json"
  	}).done(function(response){
  		console.log("success")
  		$('.user-photos').append(response)
  		$('.no-photo-msg').remove()
  		$('.upload-photo.row input[type="text"]').val("")
  		// console.log(response)
  	}).fail(function(response){
  		console.log("failure")
  	})
  })


  $('.delete-message-button').on('click', function(e){
      e.preventDefault();
      var msgToDelete = $(this).parent();
      var path = $(this).parent().attr("action")
      // console.log(path)
      var theData = $(this).parent().serialize();
      // console.log(theData)
      var request = $.ajax({
      	url: path,
      	type: "delete",
      	data: theData,
      	dataType: "json"
      })
      request.done(function(response){
      	// console.log(msgToDelete)
      	console.log("helo")

      $(".message-div#"+response.msg_id).remove();
      	// console.log()
      })
      request.fail(function(response){
      	console.log("failed")
      })
  })

  $('#edit-photo input[type="submit"]').on('click', function(e){
  	e.preventDefault();
  	var path = $(this).parent().attr("action")
  	// console.log(path);
  	// var photoId = $('#edit-photo input[name="photo_id"]').val();
  	var photoData = $(this).parent().serialize();
  	// console.log(photoId)
  	var request = $.ajax({
  		url: path,
  		type: "put",
  		data: photoData,
  		dataType: "json"
  	})
  	request.done(function(response){
  		console.log("sup")
  		$('#edit-photo input[type="text"]').val(response.newcaption)
  	})
  	request.fail(function(response){
  		console.log("bye")
  	})
  	
  })

  $('.search-bar').on('submit', function(e){
    e.preventDefault();
    var path = $(this).attr('action');
    var searchData = $(this).serialize();
    console.log(searchData);
    var request = $.ajax({
      url: path,
      type: "post",
      data: searchData,
      dataType: "json"
      // console.log(searchDa)
    })
    request.done(function(response){
      console.log('yo')
      console.log(response)
      $('.body-div').remove();
      $('body').append(response);
    })
    request.fail(function(response){
      console.log('snap')
    })
  })

  // $('.accept-request').on('click', 'button[type="submit"]', function(e){
  //   e.preventDefault();
  //   var path = $('.accept-request').attr('action')
  //   var friendData = $('.accept-request').serialize();
  //   var request = $.ajax({
  //     url:path,
  //     data: friendData,
  //     type: "put",
  //     dataType: "json"
  //   })
  //   request.done(function(response){
  //     console.log("hello");
  //     console.log(response.friend_id)
  //     $('li#'+response.friend_id).remove();
  //   })
  //   request.fail(function(response){
  //     console.log("didnt make it")
  //   })
  // })

  // $('.ignore-request').on('click', 'button[type="submit"]', function(e){
  //   e.preventDefault();
  //   var path = $('.ignore-request').attr('action')
  //   var friendData = $('.ignore-request').serialize();
  //   var request = $.ajax({
  //     url:path,
  //     data: friendData,
  //     type: "put",
  //     dataType: "json"
  //   })
  //   request.done(function(response){
  //     console.log('hihi');
  //     $('#friend-requests li#'+response.friend_id).remove();
  //   })
  //   request.fail(function(response){
  //     console.log('bye');
  //   })
  // })

  $('.add-friend-form').on('click', 'input[type="submit"]', function(e){
    // $('.add-friend-form').hide();
    e.preventDefault();
    var path = $('.add-friend-form').attr('action');
    var friendData = $('.add-friend-form').serialize();
    var request = $.ajax({
      url:path,
      data:friendData,
      type: "post",
      dataType: "json"
    })
    request.done(function(response){
      console.log("sup");
      $('.add-friend-form').hide();
    })
    request.fail(function(response){
      console.log("nope");
    })

  })

  $('#welcome-text').fadeIn(2500);

});
