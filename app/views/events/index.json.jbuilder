json.array!(events) do |event|
  json.id event.id
  json.name event.name
  json.description event.name
  json.price event.price
  json.start_time event.start_time
  json.artist event.artist unless event.artist.nil?
  json.venue event.venue unless event.venue.nil?
  json.type event.type unless event.type.nil?
  json.referrer event.referrer unless event.referrer.nil?
end
