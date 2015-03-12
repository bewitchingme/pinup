class ICSCalendarLoader
  include Sidekiq::Worker

  def perform(url, list_id)
    open(url) do |file|
      list = Admin::List.find(list_id)
      evts = []

      Icalendar.parse(file).each do |calendar|
        calendar.events.each do |event|
          uid  =  Digest::MD5.hexdigest(event.uid)
          next if Event.exists?(uid: uid) || evts.detect { |e| e[:uid] == uid }
          evts << {
            name: event.summary.to_s,
            description: event.description.to_s,
            begin_at: event.dtstart.to_datetime,
            list_id: list.id,
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