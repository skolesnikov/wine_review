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

ActiveRecord::Schema.define(version: 20141008231122) do

  create_table "log_entries", force: true do |t|
    t.string   "name"
    t.integer  "rating"
    t.string   "location"
    t.string   "comments"
    t.datetime "tasted_on"
    t.integer  "wine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "log_entries", ["wine_id"], name: "index_log_entries_on_wine_id"

  create_table "wines", force: true do |t|
    t.string   "name"
    t.integer  "year"
    t.string   "winery"
    t.string   "country"
    t.string   "varietal"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
