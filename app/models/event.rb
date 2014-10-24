class Event < ActiveRecord::Base
  
  MINIMUM_TITLE_LENGTH    = EVENTS_CONFIG['title']['length']['minimum']
  MAXIMUM_TITLE_LENGTH    = EVENTS_CONFIG['title']['length']['maximum']

  MINIMUM_CONTENT_LENGTH  = EVENTS_CONFIG['content']['length']['minimum']
  MAXIMUM_CONTENT_LENGTH  = EVENTS_CONFIG['content']['length']['maximum']

  belongs_to :artist
  
  belongs_to :venue

  belongs_to :type, class_name: 'EventType', foreign_key: 'event_type_id'

  validates :title, presence: true, allow_blank: true, length: { minimum: MINIMUM_TITLE_LENGTH,
                                                                 maximum: MAXIMUM_TITLE_LENGTH }

  validates :content, presence: true, allow_blank: true, length: { minimum: MINIMUM_CONTENT_LENGTH,
                                                                   maximum: MAXIMUM_CONTENT_LENGTH }

  before_validation :truncate_title, if: :longer_than_max_title_length?

  before_validation :truncate_content, if: :longer_than_max_content_length?

  private
    def truncate_title
      self.title = title.truncate MAXIMUM_TITLE_LENGTH, separator: ' '
    end

    def truncate_content
      self.content = content.truncate MAXIMUM_CONTENT_LENGTH, separator: ' '
    end

    def longer_than_max_title_length?
      return false if self.title.nil?
      self.title.length > MAXIMUM_TITLE_LENGTH
    end

    def longer_than_max_content_length?
      return false if self.content.nil?
      self.content.length > MAXIMUM_CONTENT_LENGTH
    end
end
