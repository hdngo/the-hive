post '/bumblebee/friend_request' do 
	@user = Bumblebee.find_by(id: params[:user_id])
	current_user.friends << @user
	@user.friends << @current_user
	current_user.pending_friends
	@user.pending_friends
	redirect "/bumblebee/user/#{@user.username}"
end

get '/bumblebee/friend_requests' do
	@pending_friends = current_user.pending_friends
 	erb :"friendships/pending"
end

put '/bumblebee/friend_requests/accept' do
	@new_friend = Bumblebee.find(params[:friend_id])
	Friendship.where("friend_id=#{@new_friend.id} AND bumblebee_id=#{current_user.id} OR friend_id=#{current_user.id} AND bumblebee_id=#{@new_friend.id}").each do |friendship| friendship.toggle!(:accepted) end
		current_user.accepted_friends
		current_user.pending_friends
		@new_friend.accepted_friends
		@new_friend.pending_friends
		@pending_friends = current_user.pending_friends
	erb :"friendships/pending"	
end

