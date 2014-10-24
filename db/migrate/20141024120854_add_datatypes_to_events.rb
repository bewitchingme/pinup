class AddDatatypesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :price, :integer
    add_column :events, :url, :string
    add_column :events, :referrer, :string
  end
end
