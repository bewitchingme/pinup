class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :set_admin

  def to_s
    "#{ name.titleize unless name.nil? }"
  end

  private

    def set_admin
      self.admin = false
    end
end
