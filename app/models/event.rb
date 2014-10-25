class Event < ActiveRecord::Base



  ### ARTIST

  belongs_to :artist

  def artist=(artist)
    if artist.is_a? Artist
      super
    else
      self.artist = Artist.find_or_create_by name: artist
    end
  end

  ### VENUE
  
  belongs_to :venue



  ### TYPE

  belongs_to :type, class_name: 'EventType', foreign_key: 'event_type_id'



  ### REFERRER

  belongs_to :referrer



  ### NAME

  MINIMUM_NAME_LENGTH = EVENTS_CONFIG['name.length.minimum']
  MAXIMUM_NAME_LENGTH = EVENTS_CONFIG['name.length.maximum']

  validates :name,        presence: true,
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
