class AddAuthorizedToVenues < ActiveRecord::Migration
  def change
  	add_column :venues, :authorized, :boolean, default: false
  end
end
