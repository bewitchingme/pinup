class Artist < ActiveRecord::Base
  before_save :to_lower_case

  has_many :events

  has_many :venues, -> { uniq }, through: :events

  def to_s
    "#{name.titleize unless name.nil? }"
  end

  private
    def to_lower_case
      self.name = name.downcase unless name.nil?
    end
end
