# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150614164813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_ads", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "url",                limit: 255
  end

  create_table "admin_banners", force: :cascade do |t|
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "url",                limit: 255
  end

  create_table "admin_csv_calendars", force: :cascade do |t|
    t.string   "file_file_name",    limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_lists", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url",        limit: 255, default: "", null: false
    t.string   "title",      limit: 255, default: "", null: false
  end

  create_table "admin_sources", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "url",         limit: 255
    t.datetime "imported_at"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "reimport"
  end

  create_table "artists", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.text     "description"
    t.datetime "begin_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
    t.integer  "venue_id"
    t.integer  "event_type_id"
    t.integer  "artist_id"
    t.integer  "referrer_id"
    t.boolean  "recurring",                   default: false
    t.boolean  "gcal"
    t.string   "uid",             limit: 255
    t.string   "day_of_week",     limit: 255, default: "",      null: false
    t.string   "type",            limit: 255, default: "Event", null: false
    t.integer  "list_id"
    t.string   "title",           limit: 255
    t.datetime "start_time"
    t.string   "url",             limit: 255
    t.integer  "duplicate_of_id"
    t.datetime "end_time"
    t.string   "rrule",           limit: 255
    t.text     "venue_details"
    t.integer  "organization_id"
    t.boolean  "locked",                      default: false
    t.integer  "source_id"
    t.boolean  "authorized",                  default: false
  end

  add_index "events", ["day_of_week"], name: "index_events_on_day_of_week", using: :btree
  add_index "events", ["uid"], name: "index_events_on_uid", unique: true, using: :btree

  create_table "referrers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "url",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.string   "url",           limit: 255
    t.datetime "imported_at"
    t.boolean  "reimport"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_type_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",                    null: false
    t.integer  "taggable_id",               null: false
    t.string   "taggable_type", limit: 255, null: false
    t.integer  "tagger_id"
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 255
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "user_groups", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "name",       limit: 255
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.boolean  "admin",                              default: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.integer  "user_group_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "address",         limit: 255
    t.string   "city",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",           limit: 255
    t.text     "description"
    t.string   "url",             limit: 255
    t.string   "street_address",  limit: 255
    t.string   "locality",        limit: 255
    t.integer  "duplicate_of_id"
    t.string   "region",          limit: 255
    t.string   "postal_code",     limit: 255
    t.string   "country",         limit: 255
    t.decimal  "latitude",                    precision: 7, scale: 4
    t.decimal  "longitude",                   precision: 7, scale: 4
    t.string   "email",           limit: 255
    t.string   "telephone",       limit: 255
    t.boolean  "closed",                                              default: false
    t.boolean  "wifi",                                                default: false
    t.text     "access_notes"
    t.integer  "events_count"
    t.integer  "source_id"
    t.boolean  "authorized",                                          default: false
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  limit: 255, null: false
    t.integer  "item_id",                null: false
    t.string   "event",      limit: 255, null: false
    t.string   "whodunnit",  limit: 255
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

end
