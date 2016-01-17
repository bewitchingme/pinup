class RenameListsToExternalCalendar < ActiveRecord::Migration
  def change
    rename_table :admin_lists, :admin_external_calendars
    rename_column :events, :list_id, :external_calendar_id
  end
end
