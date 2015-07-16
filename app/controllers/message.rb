get '/messages/new' do
	erb :"messages/new"
end

post '/messages' do
	#hey create a new message
	@recipient = Bumblebee.find_by(username: params[:recipient_username])
	@message = Message.new(sender_id: current_user.id, recipient_id: @recipient.id, content: params[:content], bumblebee_id: current_user.id)
	if @message.save
		#add message to user messages
		current_user.messages << @message
		# current_user.messages.save
		@recipient.messages << @message
		# @recipient.messages.save
		redirect "/bumblebee/user/#{@recipient.username}"
	else
		@errors = @message.errors.full_messages
	end
end

get '/messages' do
	#show all messages
	# erb :"messages/index"
end

get '/messages/:id' do
	#get a specific message
end

