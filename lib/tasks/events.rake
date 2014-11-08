namespace :events do

  desc "generates events"
  task :generate, [ :count ] => :environment do |t, args|
    100.times do
      Event.create(
          name: Forgery::LoremIpsum.title,
          description: Forgery::LoremIpsum.sentence,
          price: (5 * [*0..8].sample),
          begin_at: (DateTime.now + [*0..2].sample.year + [*0..12].sample.month + [*0..31].sample.day + [*0..24].sample.hour),
          artist: Forgery::Name.first_name,
          venue: Forgery::Name.company_name,
          referrer: Forgery::Name.company_name,
          type: EventType.all.sample
        )
    end
  end
end