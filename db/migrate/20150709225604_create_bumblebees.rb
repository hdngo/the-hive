class CreateBumblebees < ActiveRecord::Migration
  def change
  	create_table :bumblebees do |t|
  		t.string :username
  		t.string :email
  		t.string :first_name
  		t.string :last_name
  		t.string :password_hash
  		t.string :phone_number

  		t.timestamps
  	end
  end
end
