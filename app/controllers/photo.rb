post '/bumblebee/user/upload_photo' do
	# @link = params[:path]	
	# @photo = Photo.new(link: params[:newphoto], bumblebee_id: current_user.id)
	# if @photo.save
	# 	p "*" * 100
	#  p "hello harvey"
	#  p "*" * 100
	#  p params[:newphoto]
	#  content_type
	#  (erb :'photo/_new_photo', layout: false).to_json
	p params
	p params[:path]
	# p params[:newphotolink]
	@photo = Photo.create(link:params[:path], bumblebee_id: current_user.id)
	p "we are in the route"
		content_type :json
		(erb :'photo/_new_photo', layout: false).to_json

	 
	# else
	# 	p "sorry nope"
	# end
	# redirect "/bumblebee/user/#{current_user.username}"
end

get '/gallery' do
	@gallery = Photo.all
	erb :"photo/gallery"
end

get '/photo/:id' do
	@photo = Photo.find_by(id: params[:id])
	# p params
	@user = Bumblebee.find_by(id: @photo.bumblebee_id)
	erb :"photo/show"
end

get '/photo/:id/edit' do
	@photo = Photo.find_by(id: params[:id])
	@user = Bumblebee.find_by(id: @photo.bumblebee_id)
	erb :"photo/edit"
end

put '/photo/:id/edit' do
	p "you got to the route again WOO"
	@photo = Photo.find_by(id: params[:photo_id])
	@photo.update_attributes(link: @photo.link, caption: params[:caption], bumblebee_id: current_user.id)
	@photo.save!
	if request.xhr?
		p params
		p "*" * 100
		p params[:caption]
		content_type :json
		{newcaption: params[:caption]}.to_json

	else
	redirect "/photo/#{@photo.id}"
	end
	
end

