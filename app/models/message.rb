class Message < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :bumblebee, :class_name => "Bumblebee"
  belongs_to :recipient, :class_name => "Bumblebee"
end
