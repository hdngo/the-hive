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

get '/bumblebee/user/profile/edit' do
  @user = current_user
  erb :"bumblebee/editprofile"
end


put '/bumblebee/user/profile/edit' do
	current_user.update_attributes(username: params[:username], email: params[:email], first_name: params[:first_name], last_name: params[:last_name], phone_number: params[:phone_number])
	current_user.password = params[:password]
	current_user.save!
	# had to reset the session variable since we changed the current users username; the session variable still pointed to the previously set username
	session[:username] = current_user[:username]
	redirect "bumblebee/user/#{current_user.username}"
end

