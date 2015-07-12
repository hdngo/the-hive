class Friendship < ActiveRecord::Base
  # Remember to create a migration!
  belongs to :friend, foreign_key: "friend_id", class_name: "Bumblebee"
end
