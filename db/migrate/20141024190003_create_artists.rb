class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.timestamps
    end

    change_table :events do |t|
      t.integer :artist_id
    end
  end
end
