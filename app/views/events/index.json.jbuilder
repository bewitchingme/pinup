json.array!(events) do |event|
  json.extract! event, :id, :title, :content, :date_begin, :date_end, :location
  json.url event_url(event, format: :json)
end
