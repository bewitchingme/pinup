class Venue < ActiveRecord::Base

  has_many :events

  has_many :artists, -> { uniq }, through: :events

  before_save :to_lower_case

  def to_s
    "#{ name.titleize unless name.nil? }"
  end

  private
    def to_lower_case
      self.name = name.downcase unless name.nil?
    end
end
