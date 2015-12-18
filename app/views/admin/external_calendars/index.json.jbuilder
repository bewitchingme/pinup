json.array!(external_calendars) do |external_calendar|
  json.extract! external_calendar, :id
  json.url external_calendar_url(external_calendar, format: :json)
end
