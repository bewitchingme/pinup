class RenameCsvCalendarsToAdminCsvCalendars < ActiveRecord::Migration
  def change
    rename_table :csv_calendars, :admin_csv_calendars
  end
end
