class Banner < ActiveRecord::Base
  has_attached_file :image, styles: { medium: '627x68!' }, default_url: "/banners/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
