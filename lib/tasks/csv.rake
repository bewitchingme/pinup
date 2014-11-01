require 'csv'

namespace :csv do

  desc "Import events from csv file"
  task :import_events, [ :filename ] => :environment do |t, args|
    raise "No input CSV file specified" if args.filename.nil?

    Rails.logger.info "Importing events..."

    CSV.foreach(args.filename, { headers: :first_row }) do |col|
      
      event = Event.create!(
        name:         col[1],
        venue:        col[2].nil? ? nil : col[2],
        description:  col[5],
        begin_at:     ( Date.parse(col[0]) + Time.parse(col[3]).seconds_since_midnight.seconds ).to_datetime,
        price:        col[4].to_i,
        referrer:     Referrer.find_or_create_by( name: col[7], url: col[6] )
      )

      Rails.logger.info "Created event:\n\tname:\t\t#{event.name}\n\tvenue:\t\t#{event.venue}\n\tdescription:\t#{event.description}\n\tbegin_at:\t#{event.begin_at}\n\tprice:\t\t#{event.price}\n\turl:\t\t#{event.referrer.url}\n\treferrer:\t#{event.referrer}\n\n"
    end
  end
end