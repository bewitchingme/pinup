class AddTitleToVenues < ActiveRecord::Migration
  def change
  	  	change_table :venues do |t|
  		t.string :title
  		t.text     :description
  		t.string   :url
  		t.string   :street_address
	    t.string   :locality
  		t.integer  :source_id
  		t.integer  :duplicate_of_id
	    t.string   :region
    	t.string   :postal_code
    	t.string   :country
	    t.decimal  :latitude,        :precision => 7, :scale => 4
    	t.decimal  :longitude,       :precision => 7, :scale => 4
	    t.string   :email
    	t.string   :telephone
	    t.boolean  :closed, :default => false
    	t.boolean  :wifi, :default => false
    	t.text     :access_notes
    	t.integer  :events_count
  	end
  end
end
