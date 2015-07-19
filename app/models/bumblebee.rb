require 'bcrypt'
require 'Gravtastic'

class Bumblebee < ActiveRecord::Base
  include BCrypt
  include Gravtastic
  gravtastic

	validates :username, uniqueness: true, presence: true
	validates :email, uniqueness: true, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :password_hash, uniqueness: true
  


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
	has_many :conversations, 
		through: :messages,
		source: :recipient
	has_many :inverse_messages,
		foreign_key: "recipient_id", 
		class_name: "Message"
	has_many :inverse_conversationss, through: :inverse_messages, source: :bumblebee
	

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end
end
