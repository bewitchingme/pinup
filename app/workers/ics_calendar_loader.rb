class ICSCalendarLoader
  include Sidekiq::Worker

  def perform(url, external_calendar_id)
    open(url) do |file|
      external_calendar = Admin::ExternalCalendar.find(external_calendar_id)
      evts = []

      Icalendar.parse(file).each do |calendar|
        calendar.events.each do |event|
          uid  =  Digest::MD5.hexdigest(event.uid)
          next if Event.exists?(uid: uid) || evts.detect { |e| e[:uid] == uid }
          evts << {
            name: event.summary.to_s,
            description: event.description.to_s,
            begin_at: event.dtstart.to_datetime,
            external_calendar_id: external_calendar.id,
            price: 0,
            type: nil,
            artist: '',
            venue: '',
            recurring: false,
            uid: uid
          }
        end
      end

      Event.create(evts)
    end
  end
end