class UserGroup < ActiveRecord::Base
  
  has_many :users

  belongs_to :role

  def to_s
    "#{ name.titleize unless name.nil? }"
  end

  def admin?
    role.admin?
  end
end
