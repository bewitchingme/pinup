class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :title
      t.string :url
      t.datetime :imported_at
      t.boolean :reimport

      t.timestamps
    end
  end
end
