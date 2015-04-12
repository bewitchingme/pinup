class ChangeEventsAuthorized < ActiveRecord::Migration
  def change
  	remove_column :events, :authorized, :boolean
  	add_column :events, :authorized, :boolean, default: false
  end
end
