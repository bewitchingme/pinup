class CreateSidekiqTests < ActiveRecord::Migration
  def change
    create_table :sidekiq_tests do |t|
      t.string :text
      t.integer :count

      t.timestamps null: false
    end
  end
end
