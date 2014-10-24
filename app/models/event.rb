class Event < ActiveRecord::Base
  
  MINIMUM_TITLE_LENGTH = 3
  MAXIMUM_TITLE_LENGTH = 100

  MINIMUM_CONTENT_LENGTH = 10
  MAXIMUM_CONTENT_LENGTH = 100

  has_attached_file :cover, styles: {
                            medium: "300x300>",
                            thumb:  "100x100>"},
                            default_url: "/images/:style/missing.png"

  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/

  belongs_to :venue

  belongs_to :type, class_name: 'EventType', foreign_key: 'event_type_id'

  validates :title, presence: true, length: { minimum: MINIMUM_TITLE_LENGTH,
                                              maximum: MAXIMUM_TITLE_LENGTH }

  validates :content, presence: true, length: { minimum: MINIMUM_CONTENT_LENGTH,
                                                maximum: MAXIMUM_CONTENT_LENGTH }

  before_save :truncate_title, if: :longer_than_max_title_length?
  before_save :truncate_content, if: :longer_than_max_content_length?

  private
    def truncate_title
      self.title = title.truncate(MAXIMUM_TITLE_LENGTH, separator: ' ')
    end

    def truncate_content
      self.content = content.truncate(MAXIMUM_CONTENT_LENGTH, separator: ' ')
    end

    def longer_than_max_title_length?
      self.title.length > MAXIMUM_TITLE_LENGTH
    end

    def longer_than_max_content_length?
      self.content.length > MAXIMUM_CONTENT_LENGTH
    end
end
