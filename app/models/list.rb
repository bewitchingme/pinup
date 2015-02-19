class List < ActiveRecord::Base
  has_many :events

  validates :url, uniqueness: true

  before_save -> { self.url = url.downcase }
end
