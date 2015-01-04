class AddAuthorizedToEvents < ActiveRecord::Migration
  def change
    add_column :events, :authorized, :boolean, default: nil
  end
end
