get '/messages/new' do
	erb :"messages/new"
end

post '/messages' do
	#hey create a new message
	@recipient = Bumblebee.find_by(username: params[:recipient_username])
	@message = Message.create(recipient_id: @recipient.id, content: params[:content], bumblebee_id: current_user.id)
		p "THIS IS THE #{current_user.id}"
		
		
		current_user.messages << @message
		# new
		@recipient.messages << @message

		redirect "/bumblebee/user/#{@recipient.username}"
	# else
	# 	@errors = @message.errors.full_messages
	# end
end

delete '/messages' do
		# p x === 2s
	delete_message = Conversation.where(bumblebee_id: current_user.id, message_id: params[:message_id]).first
	delete_message.destroy
	# mess.destroy()
	# Conversation.where()
	redirect "bumblebee/#{current_user.username}/messages"

end

get '/bumblebee/:username/messages' do
	#show all messages
	@conversations = Bumblebee.find_by(username: params[:username])
	@messages = current_user.chat_messages
	erb :"messages/index"
end



