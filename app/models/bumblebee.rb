require 'bcrypt'
require 'Gravtastic'

class Bumblebee < ActiveRecord::Base
  include BCrypt
  include Gravtastic
  gravtastic

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

	  # i don't like the inverse friendship part, but apparently its the way of implementing mutual friendships..

	  # old way
  has_many :friendships
  has_many :friends, 
		through: :friendships
		# possibly remove this
	has_many :inverse_friendships,
  	foreign_key: "friend_id",
  	class_name: "Friendship"
	has_many :inverse_friends, through: :inverse_friendships, source: :bumblebee

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

	def accepted_friends
		@true_friends = []
		@approved_friends = self.friendships.where('accepted = true')
		@approved_friends.each do |friend|
			@true_friends << Bumblebee.find(friend.friend_id)
		end
		@true_friends.uniq!
		self.save!
		@true_friends
	end

	def pending_friends
		@debatable_friends = []
		@unaccepted_friends = self.friendships.where('accepted = false')
		@unaccepted_friends.each do |friend|
			@debatable_friends << Bumblebee.find(friend.friend_id)
			# p "NEW FRIEND"
			# p Bumblebee.find(friend.bumblebee_id).username
		end
		@debatable_friends.uniq!
		self.save!
		@debatable_friends
		# p "unaccepted"
		# p @unaccepted_friends


		
	end

end
