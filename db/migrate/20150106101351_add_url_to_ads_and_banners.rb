class AddUrlToAdsAndBanners < ActiveRecord::Migration
  def change
    add_column :ads, :url, :string
    add_column :banners, :url, :string
  end
end
