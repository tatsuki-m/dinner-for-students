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

ActiveRecord::Schema.define(version: 20150311034814) do

  create_table "restaurants", force: true do |t|
    t.string   "rstname"
    t.float    "score"
    t.string   "price_lunch"
    t.string   "price_dinner"
    t.string   "station"
    t.text     "rst_url"
    t.text     "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "station_id"
  end

  create_table "stations", force: true do |t|
    t.string   "station"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "station_url"
    t.text     "station_image1"
    t.text     "station_image2"
  end

end
