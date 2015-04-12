class RemoveSourceIdFromVenues < ActiveRecord::Migration
  def change
  	remove_column :venues, :source_id, :integer
  end
end
