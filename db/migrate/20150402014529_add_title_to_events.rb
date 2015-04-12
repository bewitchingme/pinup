class AddTitleToEvents < ActiveRecord::Migration
  def change
  	change_table :events do |t|
  		t.string :title
  		t.datetime :start_time
  		t.string   :url
  		t.integer  :source_id
  		t.integer  :duplicate_of_id
  		t.datetime :end_time
  		t.string   :rrule
  		t.text     :venue_details
  		t.integer  :organization_id
  	end
  end
end
