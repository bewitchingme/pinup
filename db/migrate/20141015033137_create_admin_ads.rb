class CreateAdminAds < ActiveRecord::Migration
  def change
    create_table :admin_ads do |t|
      t.timestamps
    end

    add_attachment :admin_ads, :image
  end
end
