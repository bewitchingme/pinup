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


  scope :monday, -> {
    where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  - 21).beginning_of_day,
       (Date.today.beginning_of_week  - 21).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  - 14).beginning_of_day,
       (Date.today.beginning_of_week  - 14).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  -  7).beginning_of_day,
       (Date.today.beginning_of_week  -  7).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ?',
       (Date.today.beginning_of_week  +  0).beginning_of_day,
       (Date.today.beginning_of_week  +  0).end_of_day
    )
  }

  scope :tuesday, -> {
    where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  - 20).beginning_of_day,
       (Date.today.beginning_of_week  - 20).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  - 13).beginning_of_day,
       (Date.today.beginning_of_week  - 13).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  -  6).beginning_of_day,
       (Date.today.beginning_of_week  -  6).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ?',
       (Date.today.beginning_of_week  +  1).beginning_of_day,
       (Date.today.beginning_of_week  +  1).end_of_day
    )
  }

  scope :wednesday, -> {
    where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  - 19).beginning_of_day,
       (Date.today.beginning_of_week  - 19).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  - 12).beginning_of_day,
       (Date.today.beginning_of_week  - 12).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  -  5).beginning_of_day,
       (Date.today.beginning_of_week  -  5).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ?',
       (Date.today.beginning_of_week  +  2).beginning_of_day,
       (Date.today.beginning_of_week  +  2).end_of_day
    )
  }

  scope :thursday, -> {
    where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  - 18).beginning_of_day,
       (Date.today.beginning_of_week  - 18).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  - 11).beginning_of_day,
       (Date.today.beginning_of_week  - 11).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  -  4).beginning_of_day,
       (Date.today.beginning_of_week  -  4).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ?',
       (Date.today.beginning_of_week  +  3).beginning_of_day,
       (Date.today.beginning_of_week  +  3).end_of_day
    )
  }

  scope :friday, -> {
    where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  - 17).beginning_of_day,
       (Date.today.beginning_of_week  - 17).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  - 10).beginning_of_day,
       (Date.today.beginning_of_week  - 10).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  -  3).beginning_of_day,
       (Date.today.beginning_of_week  -  3).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ?',
       (Date.today.beginning_of_week  +  4).beginning_of_day,
       (Date.today.beginning_of_week  +  4).end_of_day
    )
  }

  scope :saturday, -> {
    where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  -  16).beginning_of_day,
       (Date.today.beginning_of_week  -  16).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  -  9).beginning_of_day,
       (Date.today.beginning_of_week  -  9).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  -  2).beginning_of_day,
       (Date.today.beginning_of_week  -  2).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ?',
       (Date.today.beginning_of_week  +  5).beginning_of_day,
       (Date.today.beginning_of_week  +  5).end_of_day
    )
  }

  scope :sunday, -> {
    where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  -  15).beginning_of_day,
       (Date.today.beginning_of_week  -  15).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  -  8).beginning_of_day,
       (Date.today.beginning_of_week  -  8).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ? AND recurring = ?',
       (Date.today.beginning_of_week  -  1).beginning_of_day,
       (Date.today.beginning_of_week  -  1).end_of_day,
       true
    ) | where(
      'begin_at > ? AND begin_at < ?',
       (Date.today.beginning_of_week  +  6).beginning_of_day,
       (Date.today.beginning_of_week  +  6).end_of_day
    )
  }

  scope :authorized, -> {
    where('authorized = ?', true)
  }

  ### ID

  obfuscate_id



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
end
