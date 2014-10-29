class Artist < ActiveRecord::Base
  before_save :to_lower_case

  has_many :events

  has_many :venues, through: :events, uniq: true

  def to_s
    "#{name.titleize}"
  end

  private
    def to_lower_case
      self.name = name.downcase
    end
end
