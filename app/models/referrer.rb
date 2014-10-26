class Referrer < ActiveRecord::Base
  before_save :to_lower_case

  def to_s
    "#{name.humanize}"
  end

  private
    def to_lower_case
      self.name = name.downcase
    end
end
