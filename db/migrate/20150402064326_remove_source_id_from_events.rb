class RemoveSourceIdFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :source_id, :integer
  end
end
