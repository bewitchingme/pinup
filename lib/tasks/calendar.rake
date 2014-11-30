require 'nokogiri'

include ActionView::Helpers::SanitizeHelper

namespace :calendar do

  desc "generates events from calendars xml"
  task :load, [ :url ] => :environment do |t, args|

    # Delete all events on development
    Event.delete_all if Rails.env.development? 
    
    events = []

    xml_url = 'http://www.google.com/calendar/feeds/ottawajazzhappenings%40jazzworkscanada.com/public/basic'

    xml = Nokogiri::XML(open(xml_url))

    xml.css('entry').each do |entry|

      # Event location
      event_where = nil
      
      # Not used
      event_status = nil
      event_duration = nil
      
      # Event date
      event_when = nil
      event_recurring = false
      event_first_start = nil

      # Event name ands description
      event_name = strip_tags(entry.css('title').text)
      event_description = nil

      entry.css('summary').each do |summary|
        strip_tags(summary.text).each_line do |line|
          case line
          when /Where: /
            line.slice!('Where: ')
            event_where = line
          when /Event Status: /
            line.slice!('Event Status: ')
            event_status = line
          when /When: /
            line.slice!('When: ')
            event_when = line
          when /Duration: /
            line.slice!('Duration: ')
            event_duration = line
          when /First start: /
            line.slice!('First start: ')
            event_first_start = line
          when /Recurring Event/
            line.slice!('Recurring Event')
            event_recurring = true
          end
        end
      end

      entry.css('content').each do |content|
        strip_tags(content.text).each_line do |line|
          case line
          when /Where: /
            line.slice!('Where: ')
            event_where = line if event_where.nil?
          when /Event Status: /
            line.slice!('Event Status: ')
            event_status = line if event_status.nil?
          when /When: /
            line.slice!('When: ')
            event_when = line if event_when.nil?
          when /Duration: /
            line.slice!('Duration: ')
            event_duration = line if event_duration.nil?
          when /First start: /
            line.slice!('First start: ')
            event_first_start = line if event_first_start.nil?
          when /Recurring Event/
            line.slice!('Recurring Event')
            event_recurring = true if event_recurring == false
          when /Event Description: /
            line.slice!('Event Description: ')
            event_description = line if event_description.nil?
          else
            # puts line
          end
        end
      end

      if event_recurring
        events << {
          name: event_name,
          description: event_description,
          begin_at: DateTime.parse(event_first_start),
          price: 0,
          type: nil,
          referrer: nil,
          artist: '',
          venue: event_where,
          recurring: true
        }

      else
        events << {
          name: event_name,
          description: event_description,
          begin_at: DateTime.parse(event_when),
          price: 0,
          type: nil,
          referrer: nil,
          artist: '',
          venue: event_where,
          recurring: false
        }

      end
    end

    Event.create(events)
  end
end