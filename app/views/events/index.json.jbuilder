json.array!(events) do |event|
  json.id event.id
  json.name event.name
  json.description event.name
  json.price event.price
  json.begin_at event.begin_at
  json.artist event.artist unless event.artist.nil?
  json.venue event.venue unless event.venue.nil?
  json.type event.type unless event.type.nil?
  json.referrer event.referrer unless event.referrer.nil?
end
