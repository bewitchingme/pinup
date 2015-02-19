class AddUrlToLists < ActiveRecord::Migration
  def change
    add_column :lists, :url, :string, null: false, default: '', unique: true
  end
end
