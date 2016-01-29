class RemoveExternalCalendars < ActiveRecord::Migration
  def change
    drop_table :admin_external_calendars
    rename_column :events, :external_calendar_id, :source_id
  end
end
