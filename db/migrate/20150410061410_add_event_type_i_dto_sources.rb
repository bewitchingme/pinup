class AddEventTypeIDtoSources < ActiveRecord::Migration
  def change
  	add_column :sources, :event_type_id, :integer
  end
end
