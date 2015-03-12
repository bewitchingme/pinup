class RenameListsToAdminLists < ActiveRecord::Migration
  def change
    rename_table :lists, :admin_lists
  end
end
