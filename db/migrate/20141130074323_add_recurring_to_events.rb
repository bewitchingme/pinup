class AddRecurringToEvents < ActiveRecord::Migration
  def change
    add_column :events, :recurring, :boolean, default: false
  end
end
