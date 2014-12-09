class CreateCsvCalendars < ActiveRecord::Migration
  def change
    create_table :csv_calendars do |t|
      t.attachment :file
      t.timestamps
    end
  end
end
