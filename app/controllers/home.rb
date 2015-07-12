get '/' do
	@bees = Bumblebee.all
	erb :"home/home"
end

# login routes
get '/login' do
	erb :"home/login"
end

get '/login/viaUN' do
	erb :"home/UNlogin"
end

get '/login/viaE' do
	erb :"home/Elogin"
end	

get '/signup' do
	erb :"home/signup"
end

post '/bumblebee/login' do
		if params[:username]
			@user = Bumblebee.find_by(username: params[:username])
			unless !@user.nil? && @user.password == params[:password]
				return "Invalid Login Credentials."
			end
			login(@user.username)
			redirect "/bumblebee/user/#{@user.username}"
		elsif params[:email]
			@user = Bumblebee.find_by(email: params[:email])
			unless !@user.nil? && @user.password == params[:password]
				return "Invalid Login Credentials."
			end
			login(@user.username)
		redirect "/bumblebee/user/#{@user.username}"
		end
end