class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners
    add_attachment :banners, :image
  end

  def self.down
    remove_attachment :banners, :image
    drop_table :banners
  end
end
