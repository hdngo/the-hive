get '/messages/new' do
	erb :"messages/new"
end

post '/messages' do
	#hey create a new message
	@recipient = Bumblebee.find_by(username: params[:recipient_username])
	@message = Message.create(recipient_id: @recipient.id, content: params[:content])
		p "THIS IS THE #{current_user.id}"
		
		
		current_user.messages << @message

		redirect "/bumblebee/user/#{@recipient.username}"
	# else
	# 	@errors = @message.errors.full_messages
	# end
end

delete '/messages' do
	x= params[:message_id]
	# p x === 2
	delete_message = Message.find(params[:message_id])
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



