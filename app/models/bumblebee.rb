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

	has_many :messages
	has_many :conversations, through: :messages, source: :recipient
	has_many :inverse_messages,
		foreign_key: "recipient_id", 
		class_name: "Message"
	has_many :inverse_conversations, through: :inverse_messages, source: :bumblebee
	

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end

	def chat_messages
		@chat_messages = (self.messages + self.inverse_messages).uniq
		@chat_messages.sort_by {|chat_message| chat_message.created_at}.reverse!
	end

	def delete_message(message_id)
		deleted_message = self.messages.where("id = #{message_id}")
		p deleted_message
		
	end

	# def accepted_friends
	# 	@accepted_friends = self.friendships
	# end

end
