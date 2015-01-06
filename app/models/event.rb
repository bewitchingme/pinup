class Event < ActiveRecord::Base

  ##############################
  ### Event                  ###
  ##############################
  ### id:          integer   ###
  ### name:        string    ###
  ### description: string    ###
  ### price:       integer   ###
  ### begin_at:    datetime  ###
  ### artist:      Artist    ###
  ### venue:       Venue     ###
  ### referrer:    Referrer  ###
  ### type:        EventType ###
  ##############################


  RECURSIVE_DEPTH = 104

  def self.monday
    self.find_recurring_events_for :monday, depth: RECURSIVE_DEPTH
  end

  def self.tuesday
    self.find_recurring_events_for :tuesday, depth: RECURSIVE_DEPTH
  end

  def self.wednesday
    self.find_recurring_events_for :wednesday, depth: RECURSIVE_DEPTH
  end

  def self.thursday
    self.find_recurring_events_for :thursday, depth: RECURSIVE_DEPTH
  end

  def self.friday
    self.find_recurring_events_for :friday, depth: RECURSIVE_DEPTH
  end
  
  def self.saturday
    self.find_recurring_events_for :saturday, depth: RECURSIVE_DEPTH
  end
  
  def self.sunday
    self.find_recurring_events_for :sunday, depth: RECURSIVE_DEPTH
  end

  scope :authorized, -> {where('authorized = ?', true)}



  ### ID

  # obfuscate_id



  ### PAGINATION

  PAGINATES_PER = EVENTS_CONFIG['pagination.per']

  paginates_per PAGINATES_PER



  ### NAME

  MINIMUM_NAME_LENGTH = EVENTS_CONFIG['name.length.minimum']
  MAXIMUM_NAME_LENGTH = EVENTS_CONFIG['name.length.maximum']

  validates :name,  presence: true,
                    allow_blank: false,
                    length: { minimum: MINIMUM_NAME_LENGTH,
                              maximum: MAXIMUM_NAME_LENGTH }

  before_validation :truncate_name, if: :longer_than_max_name_length?



  ### DESCRIPTION

  MINIMUM_DESCRIPTION_LENGTH = EVENTS_CONFIG['description.length.minimum']
  MAXIMUM_DESCRIPTION_LENGTH = EVENTS_CONFIG['description.length.maximum']

  validates :description, presence: true,
                          allow_blank: false,
                          length: { minimum: MINIMUM_DESCRIPTION_LENGTH,
                                    maximum: MAXIMUM_DESCRIPTION_LENGTH }
  
  before_validation :truncate_description, if: :longer_than_max_description_length?



  ### ARTIST

  belongs_to :artist

  def artist=(artist)
    return super if artist.is_a? Artist || artist.nil?
    self.artist = Artist.find_or_create_by name: artist.downcase
  end



  ### VENUE
  
  belongs_to :venue

  def venue=(venue)
    return super if venue.is_a?(Venue) || venue.nil?
    self.venue = Venue.find_or_create_by name: venue.downcase
  end



  ### BEGIN AT

  validates :begin_at, presence: true

  def begin_at=(begin_at)
    return super if begin_at.is_a?(DateTime) || begin_at.nil?
    self.begin_at = begin_at.empty? ? DateTime.now : DateTime.parse(begin_at)
  end

  def begin_at_date
    begin_at.to_date
  end

  def begin_at_time
    begin_at.to_time
  end

  def begin_at_hour
    begin_at_time.hour
  end



  ### TYPE

  belongs_to :type, class_name: 'EventType', foreign_key: 'event_type_id'

  def type=(type)
    return super if type.is_a?(EventType) or type.nil?
    self.type = EventType.find_or_create_by name: type.downcase
  end

  def type_icon
    return 'icons/misc.png' if type.nil?
    type.icon
  end



  ### REFERRER

  belongs_to :referrer

  def referrer=(referrer)
    return super if referrer.is_a?(Referrer) or referrer.nil?
    self.referrer = Referrer.find_or_create_by name: referrer.downcase
  end



  ### MISC AND UTILITY

  def to_s
    "#{ name.titleize unless name.nil? }"
  end



  private



    ### NAME

    def truncate_name
      self.name = name.truncate MAXIMUM_NAME_LENGTH, separator: ' '
    end

    def longer_than_max_name_length?
      return false if name.nil?
      name.length > MAXIMUM_NAME_LENGTH
    end



    ### DESCRIPTION

    def truncate_description
      self.description = description.truncate MAXIMUM_DESCRIPTION_LENGTH, separator: ' '
    end

    def longer_than_max_description_length?
      return false if description.nil?
      description.length > MAXIMUM_DESCRIPTION_LENGTH
    end



    ### EVENTS

    def self.find_recurring_events_for(day, opts)
      depth = opts[:depth]
      case day
      when :monday
        find_recursively_recurring_events_by_index(0, depth)

      when :tuesday
        find_recursively_recurring_events_by_index(1, depth)

      when :wednesday
        find_recursively_recurring_events_by_index(2, depth)

      when :thursday
        find_recursively_recurring_events_by_index(3, depth)

      when :friday
        find_recursively_recurring_events_by_index(4, depth)

      when :saturday
        find_recursively_recurring_events_by_index(5, depth)

      when :sunday
        find_recursively_recurring_events_by_index(6, depth)

      end
    end

    def self.find_recursively_recurring_events_by_index(index, depth)
      events = []
      (1..depth).each do |i|
        events += find_recurring_events_between(
          (Date.today.beginning_of_week  -  (7 * i - index)).beginning_of_day,
          (Date.today.beginning_of_week  -  (7 * i - index)).end_of_day
        )
      end
      events += find_events_between(
        (Date.today.beginning_of_week + index).beginning_of_day,
        (Date.today.beginning_of_week + index).end_of_day
      )
      return events.uniq
    end

    def self.find_recurring_events_between(time_begin, time_end)
      where(
        begin_at: time_begin..time_end,
        recurring: true,
        authorized: true
      )
    end

    def self.find_events_between(time_begin, time_end)
      where(
        begin_at: time_begin..time_end,
        authorized: true
      )
    end
end
