class AddAdminSourceIdToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :admin_source_id, :integer
  end
end
