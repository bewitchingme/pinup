class Artist < ActiveRecord::Base
  has_many :events

  has_many :venues, through: :events

  def to_s
    "#{name}"
  end
end
