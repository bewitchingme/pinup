class Admin::ExternalCalendar < ActiveRecord::Base
  has_many :events

  validates :title, presence: true

  validates :url, presence: true, uniqueness: true

  # KT@HOME - 2016/01/17: Issue #33 This is broken for links that use generated UIDs such as (i dunno... FACEBOOK LINKS FOR EXAMPLE?!)
  # before_save -> { self.url = url.downcase }

  def to_s
    "#{ title }"
  end

  alias_method :name, :to_s
end
