class AddGcalAndGcalIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :gcal, :boolean, null: true, default: nil
    add_column :events, :gcal_id, :string, null: true, default: nil
  end
end
