post '/bumblebee/friend_request' do 
	@user = Bumblebee.find_by(id: params[:user_id])
	current_user.friends << @user
	@user.friends << @user.inverse_friends.last
	redirect "/bumblebee/user/#{@user.username}"
end