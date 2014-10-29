class Venue < ActiveRecord::Base

  has_many :events

  has_many :artists, through: :events, uniq: true

  before_save :to_lower_case

  def to_s
    "#{name.titleize}"
  end

  private
    def to_lower_case
      self.name = name.downcase
    end
end
