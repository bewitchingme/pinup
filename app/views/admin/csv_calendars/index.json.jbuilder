json.array!(csv_calendars) do |csv_calendar|
  json.extract! csv_calendar, :id
  json.url admin_csv_calendar_url(csv_calendar, format: :json)
end
