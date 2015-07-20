class Message < ActiveRecord::Base
  # Remember to create a migration!
  # # old
  # belongs_to :bumblebee, :class_name => "Bumblebee"
  # belongs_to :recipient, :class_name => "Bumblebee"

# new
  has_many :conversations
  has_many :users, through: :conversations
end
