require './app/workers/ics_calendar_loader'
require './app/workers/xml_calendar_loader'

class Digger::Calendar
  def self.load
    Admin::List.all.each do |list|
      open(list.url) do |file|
        case file.content_type
        when 'application/atom+xml'
          parse_xml_calendar(list.url, list.id)
        when 'text/calendar'
          parse_ics_calendar(list.url, list.id)
        else
          raise "Unsupported Format"
        end
      end
    end
  end

  def self.parse_xml_calendar(url, list_id)
    XMLCalendarLoader.perform_async(url, list_id)
  end

  def self.parse_ics_calendar(url, list_id)
    ICSCalendarLoader.perform_async(url, list_id)
  end
end