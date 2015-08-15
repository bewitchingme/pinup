class AddOrigIdToVenues < ActiveRecord::Migration
  def change
  	add_column :venues, :orig_id, :integer
  end
end
