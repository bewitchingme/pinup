require 'csv'

namespace :csv do

  desc "Import events from csv file"
  task :import_events, [ :filename ] => :environment do |t, args|
    raise "No input CSV file specified" if args.filename.nil?

    Rails.logger.info "Importing events..."

    CSV.foreach(args.filename, { headers: :first_row }) do |col|
      
      event = Event.create!(
        title:      col[1],
        venue:      ( col[2].nil? ? nil : Venue.find_or_create_by(name: col[2]) ),
        content:    col[5],
        date_begin: ( Date.parse(col[0]) + Time.parse(col[3]).seconds_since_midnight.seconds ).to_datetime,
        price:      col[4].to_i,
        url:        col[6],
        referrer:   col[7]
      )

      Rails.logger.info "Created event:\n\ttitle:\t\t#{event.title}\n\tvenue:\t\t#{event.venue}\n\tcontent:\t#{event.content}\n\tdate_begin:\t#{event.date_begin}\n\tprice:\t\t#{event.price}\n\turl:\t\t#{event.url}\n\treferrer:\t#{event.referrer}\n\n"
    end
  end
end