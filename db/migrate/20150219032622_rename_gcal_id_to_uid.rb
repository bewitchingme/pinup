class RenameGcalIdToUid < ActiveRecord::Migration
  def change
    rename_column :events, :gcal_id, :uid
    add_index :events, :uid, unique: true
  end
end
