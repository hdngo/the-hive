post '/bumblebee/user/upload_photo' do
	@link = params[:path]	
	@photo = Photo.create(link: "/user_imgs/" + params[:path], bumblebee_id: current_user.id)
	redirect "/bumblebee/user/#{current_user.username}"
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

