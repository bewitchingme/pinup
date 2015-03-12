require 'csv'
require "open-uri"

class CsvCalendarLoader
  include Sidekiq::Worker

  def perform(csv_calendar_id)
    return unless csv_calendar_id.kind_of? Integer
    return unless Admin::CsvCalendar.exists? csv_calendar_id

    csv_calendar = Admin::CsvCalendar.find(csv_calendar_id)
    path = open(csv_calendar.file.path)
    events = []

    CSV.foreach(path, { headers: :first_row }) do |col|
      uid = Digest::MD5.hexdigest(col[1])
      
      events << {
        name:         col[1],
        venue:        col[2],
        description:  col[5],
        begin_at:     ( Date.parse(col[0]) + Time.parse(col[3]).seconds_since_midnight.seconds ).to_datetime,
        price:        col[4].to_i,
        referrer:     Referrer.find_or_create_by( name: col[7], url: col[6] ),
        uid:          uid
      }
      
      Event.create(events)
    end
  end
end