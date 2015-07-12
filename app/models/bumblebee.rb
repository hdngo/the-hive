require 'bcrypt'

class Bumblebee < ActiveRecord::Base
  include BCrypt

	validates :username, uniqueness: true, presence: true
	validates :email, uniqueness: true, presence: true
	validates :first_name, presence: true
	validates :last_name, uniqueness: true
	validates :password_hash, uniqueness: true
  has_many :photos

  # i don't like the inverse friendship part, but apparently its the way of implementing mutual friendships..
  has_many :friendships
  has_many :friends, 
		through: :friendships
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
end
