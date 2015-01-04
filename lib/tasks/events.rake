namespace :events do

  desc "generates events"
  task :generate, [ :count ] => :environment do |t, args|
    events = []
    100.times do
      events << {
        name: Forgery::LoremIpsum.words([*1..10].sample),
        description: Forgery::LoremIpsum.words([*3..30].sample),
        price: (5 * [*0..8].sample),
        begin_at: (DateTime.now + [*0..2].sample.year + [*0..12].sample.month + [*0..31].sample.day + [*0..24].sample.hour),
        artist: Forgery::Name.first_name,
        venue: Forgery::Name.company_name,
        referrer: Forgery::Name.company_name,
        type: EventType.all.sample 
      }
    end

    Event.create(events)
  end
end