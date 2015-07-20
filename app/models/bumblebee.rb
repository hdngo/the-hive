require 'bcrypt'
require 'Gravtastic'

class Bumblebee < ActiveRecord::Base
  include BCrypt
  include Gravtastic
  gravtastic

	
	
  


  # i don't like the inverse friendship part, but apparently its the way of implementing mutual friendships..
  has_many :friendships
  has_many :friends, 
		through: :friendships
	has_many :inverse_friendships,
  	foreign_key: "friend_id",
  	class_name: "Friendship"
	has_many :inverse_friends, through: :inverse_friendships, source: :bumblebee

	has_many :photos

	# old model
	# has_many :messages
	# has_many :conversations, through: :messages, source: :recipient
	# has_many :inverse_messages,
	# 	foreign_key: "recipient_id", 
	# 	class_name: "Message"
	# has_many :inverse_conversations, through: :inverse_messages, source: :bumblebee
	
	# remodel
	has_many :conversations
	has_many :messages, through: :conversations

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end

	def chat_messages
		@chat_messages = (self.messages)
		@chat_messages.sort_by {|chat_message| chat_message.created_at}.reverse!
	end


	# def accepted_friends
	# 	@accepted_friends = self.friendships
	# end

end
