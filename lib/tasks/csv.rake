require 'csv'

namespace :csv do
  
  desc "Import events from csv file"
  task :import_events, [ :filename ] => :environment do |t, args|

    CSV.foreach(args.filename, { headers: :first_row }) do |row|

      event = Event.create(
        title:      row[1],
        venue:      Venue.find_or_create(name: row[2]),
        content:    row[5],
        date_begin: ( Date.parse(row[0]) + Time.parse(row[3]).seconds_since_midnight.seconds ).to_datetime,
        price:      row[4]
      )

      puts "Created event #{event.title}\n#{event.content}\n#{date_begin}"
    end

  end

end