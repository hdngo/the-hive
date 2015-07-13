post '/bumblebee/new' do
	# erb :"bumblebee/new"
	@bee = Bumblebee.new(username: params[:username], first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number])
	@bee.password = params[:password]
	@bee.save!
	redirect '/'
end

get '/bumblebee/user/:username' do
	@user = Bumblebee.find_by(username: params[:username])
	erb :"bumblebee/profile"
end

get '/bumblebee/logout' do
	logout
	redirect '/'
end

post '/bumblebee/user/:username/friend_request' do
	@message = params[:request_message]
	@user = Bumblebee.where(username: params[:username])

end