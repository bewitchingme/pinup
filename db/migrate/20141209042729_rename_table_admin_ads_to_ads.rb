class RenameTableAdminAdsToAds < ActiveRecord::Migration
  def change
    rename_table :admin_ads, :ads
  end
end
