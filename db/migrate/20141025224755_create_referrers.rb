class CreateReferrers < ActiveRecord::Migration
  def change
    create_table :referrers do |t|
      t.string :name
      t.string :url

      t.timestamps
    end

    change_table :events do |t|
      t.integer :referrer_id
    end
  end
end
