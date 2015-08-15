class CreateArtistsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :artists, :events do |t|
      # t.index [:artist_id, :event_id]
      t.index [:event_id, :artist_id], unique: true
    end
  end
end
