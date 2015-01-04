class ChangeEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.rename :title, :name
      t.rename :content, :description
      t.rename :date_begin, :begin_at

      t.remove :location
      t.remove :date_end
      t.remove :url
      t.remove :referrer
    end

    remove_attachment :events, :cover
  end

  def self.down
    change_table :events do |t|
      t.rename :name, :title
      t.rename :description, :content
      t.rename :begin_at, :date_begin

      t.string :location
      t.datetime :date_end
      t.string :url
      t.string :referrer
    end

    add_attachment :events, :cover
  end
end
