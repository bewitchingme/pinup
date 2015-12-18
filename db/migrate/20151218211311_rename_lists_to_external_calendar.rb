class RenameListsToExternalCalendar < ActiveRecord::Migration
  def change
    rename_table :admin_lists, :admin_external_calendars
  end
end
