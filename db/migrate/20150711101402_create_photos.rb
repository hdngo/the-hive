class CreatePhotos < ActiveRecord::Migration
  def change
  	create_table   :photos do |t|
  		t.string     :link
  		t.string     :caption

  		t.references :bumblebee, 
  								 :index => true
  		t.timestamps
  	end
  end
end
