class CreateMessages < ActiveRecord::Migration
  def change
  	create_table :messages do |t|
  		t.integer :recipient_id
  		t.text       :content

      t.references :bumblebee, index: true
  		t.timestamps
  	end
  end
end
