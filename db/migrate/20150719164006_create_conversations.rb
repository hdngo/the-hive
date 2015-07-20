class CreateConversations < ActiveRecord::Migration
  def change
  	create_table :conversations do |t|
  		t.integer :bumblebee_id
  		t.integer :message_id
  	end
  end
end
