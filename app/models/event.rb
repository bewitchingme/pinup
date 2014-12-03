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



  ### ID

  obfuscate_id



  ### PAGINATION

  PAGINATES_PER = EVENTS_CONFIG['pagination.per']

  paginates_per PAGINATES_PER



  ### NAME

  MINIMUM_NAME_LENGTH = EVENTS_CONFIG['name.length.minimum']
  MAXIMUM_NAME_LENGTH = EVENTS_CONFIG['name.length.maximum']

  validates :name,  presence: true,
                    allow_blank: true,
                    length: { minimum: MINIMUM_NAME_LENGTH,
                              maximum: MAXIMUM_NAME_LENGTH }

  before_validation :truncate_name, if: :longer_than_max_name_length?



  ### DESCRIPTION

  MINIMUM_DESCRIPTION_LENGTH = EVENTS_CONFIG['description.length.minimum']
  MAXIMUM_DESCRIPTION_LENGTH = EVENTS_CONFIG['description.length.maximum']

  validates :description, presence: true,
                          allow_blank: true,
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
    return super if venue.is_a? Venue || venue.nil?
    self.venue = Venue.find_or_create_by name: venue.downcase
  end



  ### BEGIN AT

  def begin_at=(begin_at)
    return super if begin_at.is_a? DateTime
    self.begin_at = begin_at.nil? || begin_at.empty? ? DateTime.now : DateTime.parse(begin_at)
  end

  def begin_at_date
    begin_at.to_date
  end

  def begin_at_time
    begin_at.to_time
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
