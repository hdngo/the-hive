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

});
