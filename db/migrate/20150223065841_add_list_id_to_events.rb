class AddListIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :list_id, :integer
  end
end
