require './app/workers/ics_calendar_loader'
require './app/workers/xml_calendar_loader'

class Digger::Calendar
  def self.load
    Admin::ExternalCalendar.all.each do |external_calendar|
      open(external_calendar.url) do |file|
        case file.content_type
        when 'application/atom+xml'
          parse_xml_calendar(external_calendar.url, external_calendar.id)
        when 'text/calendar'
          parse_ics_calendar(external_calendar.url, external_calendar.id)
        else
          raise "Unsupported Format"
        end
      end
    end
  end

  def self.parse_xml_calendar(url, external_calendar_id)
    XMLCalendarLoader.perform_async(url, external_calendar_id)
  end

  def self.parse_ics_calendar(url, external_calendar_id)
    ICSCalendarLoader.perform_async(url, external_calendar_id)
  end
end