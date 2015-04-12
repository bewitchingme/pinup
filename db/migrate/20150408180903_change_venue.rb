class ChangeVenue < ActiveRecord::Migration
  def change
  	remove_column :venues, :admin_source_id, :integer
  	add_column :venues, :source_id, :integer
  end
end
