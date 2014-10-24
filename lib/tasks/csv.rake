require 'csv'

namespace :csv do

  desc "Import events from csv file"
  task :import_events, [ :filename ] => :environment do |t, args|
    raise "No input CSV file specified" if args.filename.nil?

    CSV.foreach(args.filename, { headers: :first_row }) do |col|
      
      event = Event.create(
        title:      col[1],
        venue:      ( col[2].nil? ? nil : Venue.find_or_create_by(name: col[2]) ),
        content:    col[5],
        date_begin: ( Date.parse(col[0]) + Time.parse(col[3]).seconds_since_midnight.seconds ).to_datetime,
        price:      col[4].to_i,
        url:        col[6],
        referrer:   col[7]
      )

      puts "Created event:\n\t#{event.title}\n\t#{event.venue}\n\t#{event.content}\n\t#{event.date_begin}\n\t#{event.price}\n\t#{event.url}\n\t#{event.referrer}"
    end
  end
end