class AddOriginalTtitletoVenues < ActiveRecord::Migration
  def change
  	add_column :venues, :original_title, :string
  end
end
