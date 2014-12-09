json.array!(@csv_calendars) do |csv_calendar|
  json.extract! csv_calendar, :id
  json.url csv_calendar_url(csv_calendar, format: :json)
end
