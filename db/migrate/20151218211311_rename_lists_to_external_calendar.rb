class RenameListsToExternalCalendar < ActiveRecord::Migration
  def change
    rename_table :lists, :external_calendars
  end
end
