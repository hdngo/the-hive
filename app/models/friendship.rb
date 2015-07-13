class Friendship < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :bumblebee
  belongs_to :friend, class_name: "Bumblebee"
end
