class CreateFriendships < ActiveRecord::Migration
  def change
  	create_table :friendships do |t|
  		t.integer :friend_id
  	end
  end
end
