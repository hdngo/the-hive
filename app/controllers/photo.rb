post '/bumblebee/user/upload_photo' do
	@link = params[:path]	
	@photo = Photo.create(link: "/user_imgs/" + params[:path], bumblebee_id: current_user.id)
	redirect "/bumblebee/user/#{current_user.username}"
end