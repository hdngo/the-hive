class Photo < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :bumblebee

  validates :link, presence: true
end
