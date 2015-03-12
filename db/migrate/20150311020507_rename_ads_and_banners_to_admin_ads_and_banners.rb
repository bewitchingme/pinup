class RenameAdsAndBannersToAdminAdsAndBanners < ActiveRecord::Migration
  def change
    rename_table :ads, :admin_ads
    rename_table :banners, :admin_banners
  end
end
