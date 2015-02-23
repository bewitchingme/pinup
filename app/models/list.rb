class List < ActiveRecord::Base
  has_many :events

  validates :title, presence: true

  validates :url, presence: true, uniqueness: true

  before_save -> { self.url = url.downcase }

  def to_s
    "#{ title.titleize }"
  end

  alias_method :name, :to_s
end
