class CreateAdminSources < ActiveRecord::Migration
  def change
    create_table :admin_sources do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "imported_at"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.boolean  "reimport"
    end
  end
end
