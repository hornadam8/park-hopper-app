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

ActiveRecord::Schema.define(version: 20200428151422) do

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.string "link"
    t.string "location"
    t.string "description"
    t.string "information"
    t.string "weather"
    t.string "tours_and_camping"
    t.string "wildlife"
    t.string "nearby_parks"
    t.string "image"
    t.float  "latitude"
    t.float  "longitude"
  end

  create_table "trips", force: :cascade do |t|
    t.string  "review"
    t.date    "visit_date"
    t.integer "user_id"
    t.integer "park_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

end
