class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :content
      t.datetime :date_begin
      t.datetime :date_end
      t.string :location

      t.timestamps
    end
  end
end
