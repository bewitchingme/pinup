class Role < ActiveRecord::Base
  def to_s
    "#{ name.titleize unless name.nil? }"
  end

  def admin?
    return true if name == 'admin'
    false
  end
end
