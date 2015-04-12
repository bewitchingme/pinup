class AddAdminSourceIdToVenue < ActiveRecord::Migration
  def change
  	add_column :venues, :admin_source_id, :integer
  end
end
