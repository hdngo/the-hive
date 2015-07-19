class Friendship < ActiveRecord::Base
  belongs_to :bumblebee, :class_name => "Bumblebee"
  belongs_to :friend, :class_name => "Bumblebee"
end