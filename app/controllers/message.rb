get '/messages/new' do
	erb :"messages/new"
end

post '/messages' do
	#hey create a new message
	@recipient = Bumblebee.find_by(username: params[:recipient_username])
	# @sender_id = current_user.id
	@message = Message.create(recipient_id: @recipient.id, content: params[:content], bumblebee_id: current_user.id)
		#add message to user messages
		# current_user.messages << current_user.inverse_messages.last
		p "THIS IS THE #{current_user.id}"
		# the message created is added to the user who sends it, then the recipient receives it as an inverse message, which we add to their messages
		
		@recipient.messages << @recipient.inverse_messages.last
		current_user.messages << @recipient.messages.last

		redirect "/bumblebee/user/#{@recipient.username}"
	# else
	# 	@errors = @message.errors.full_messages
	# end
end

get '/messages' do
	#show all messages
	# erb :"messages/index"
end

get '/messages/:id' do
	#get a specific message
end

