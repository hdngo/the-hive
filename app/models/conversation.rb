class Conversation < ActiveRecord::Base
	belongs_to :bumblebee
	belongs_to :message
end