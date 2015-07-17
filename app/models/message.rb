class Message < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :bumblebee
  belongs_to :recipient, class_name: "Bumblebee"
end
