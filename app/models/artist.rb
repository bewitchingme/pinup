class Artist < ActiveRecord::Base
  before_save :to_lower_case

  has_many :events

  has_many :venues, through: :events

  def to_s
    "#{name.humanize}"
  end

  private
    def to_lower_case
      self.name = name.downcase
    end
end
