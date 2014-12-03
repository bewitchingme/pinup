require 'nokogiri'
require 'digest/sha1'

include ActionView::Helpers::SanitizeHelper

namespace :calendar do

  desc "generates events from calendars xml"
  task :load, [ :url ] => :environment do |t, args|

    events_count = 0
    recurring_events_count = 0
    
    events = []

    xml_urls = %w(
      ottawajazzhappenings%40jazzworkscanada.com/public/basic
      jazzworkscanada.com_29lcl1pmtk661nr45rv5hckho8%40group.calendar.google.com/public/basic
      jazzworkscanada.com_g53tni1lq25vk1kt66ljin2sg4%40group.calendar.google.com/public/basic 
    ).map { |url| "http://www.google.com/calendar/feeds/#{url}" }

    xml_urls.each do |xml_url|
      xml = Nokogiri::XML(open(xml_url))

      xml.css('entry').each do |entry|

        # Event id
        event_id = Digest::SHA1.hexdigest(strip_tags(entry.css('id').text.encode('UTF-8')).html_safe)
        next if Event.exists?(gcal_id: event_id)

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
        event_name = strip_tags(entry.css('title').text.encode('UTF-8')).html_safe
        event_description = nil

        entry.css('summary').each do |summary|
          strip_tags(summary.text.encode('UTF-8')).html_safe.each_line do |line|
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
          strip_tags(content.text.encode('UTF-8')).html_safe.each_line do |line|
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
              recurring: true,
              gcal_id: event_id,
              gcal: true
            }
          events_count += 1

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
            recurring: false,
            gcal_id: event_id,
            gcal: true
          }
          recurring_events_count += 1
        end

      end
    end

    puts "Created #{events_count} events and #{recurring_events_count} recurring events."
    Event.create(events)
  end
end