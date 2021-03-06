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

ActiveRecord::Schema.define(version: 20160712211115) do

  create_table "armies", force: :cascade do |t|
    t.integer  "side_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "armies_battles", force: :cascade do |t|
    t.integer  "army_id"
    t.integer  "battle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "armies_events", force: :cascade do |t|
    t.integer  "army_id"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "battles", force: :cascade do |t|
    t.date     "begin_date"
    t.date     "end_date"
    t.string   "name"
    t.integer  "location_id"
    t.integer  "victor_id"
    t.integer  "campaign_id"
    t.string   "conclusion"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "battles", ["campaign_id"], name: "index_battles_on_campaign_id"
  add_index "battles", ["location_id"], name: "index_battles_on_location_id"
  add_index "battles", ["victor_id"], name: "index_battles_on_victor_id"

  create_table "campaigns", force: :cascade do |t|
    t.string   "name"
    t.integer  "army_id"
    t.date     "begin_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.integer  "campaign_id"
    t.integer  "location_id"
    t.date     "begin_date"
    t.date     "end_date"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "events", ["campaign_id"], name: "index_events_on_campaign_id"
  add_index "events", ["location_id"], name: "index_events_on_location_id"

  create_table "locations", force: :cascade do |t|
    t.string   "city"
    t.string   "state"
    t.string   "county"
    t.decimal  "lat"
    t.decimal  "long"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "location_name"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "side_id"
    t.text     "bio"
    t.date     "birthdate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ranks", force: :cascade do |t|
    t.integer  "player_id"
    t.string   "title"
    t.date     "begin_date"
    t.date     "end_date"
    t.integer  "army_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sides", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
