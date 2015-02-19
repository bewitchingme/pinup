class Digger::Calendar
  def self.load
    List.all.each do |list|
      open(list.url) do |file|
        case file.content_type
        when 'application/atom+xml'
          parse_xml_calendar(file, list)
        when 'text/calendar'
          parse_ics_calendar(file, list)
        else
          raise "Unsupported Format"
        end
      end
    end
  # rescue Exception => e
    # Rails.logger.error e.message
  end

  def self.parse_xml_calendar(file, list)
    xml = Nokogiri::XML(file)

    xml.css('entry').each do |entry|

      # Event id
      event_id = Digest::MD5.hexdigest(strip_tags(entry.css('id').text.encode('UTF-8')).html_safe)
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

      Event.new({
        name: event_name,
        description: event_description,
        begin_at: DateTime.parse(event_first_start),
        list_id: list.id,
        price: 0,
        type: nil,
        referrer: nil,
        artist: '',
        venue: event_where,
        recurring: event_recurring,
        uid: event_id,
        gcal: true
      })
    end
  end

  def self.parse_ics_calendar(file, list)
    calendars = Icalendar.parse(file)

    calendars.each do |calendar|
      calendar.events.each do |event|
        puts "----------"
        puts Event.new({
          name: event.summary,
          description: event.description,
          begin_at: DateTime.parse(event.dtstart),
          list_id: list.id,
          price: 0,
          type: nil,
          artist: '',
          venue: '',
          recurring: false,
          uid: Digest::MD5.hexdigest(event.id),
          gcal: false
        }).inspect
        puts "----------"
      end
    end
  end
end