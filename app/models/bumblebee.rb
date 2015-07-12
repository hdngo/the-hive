require 'bcrypt'

class Bumblebee < ActiveRecord::Base
  include BCrypt

	validates :username, uniqueness: true, presence: true
	validates :email, uniqueness: true, presence: true
	validates :first_name, presence: true
	validates :last_name, uniqueness: true
	validates :password_hash, uniqueness: true
  has_many :photos

  has_many :friendships,
  	foreign_key: "friend_id",
  	class_name: "Friendship"
	has_many :friends, 
		through: :friendships,
		source: :friend

	def password
		@password ||= Password.new(password_hash)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.password_hash = @password
	end
end
