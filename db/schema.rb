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

ActiveRecord::Schema.define(version: 20170214003927) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.string   "credit_card"
    t.date     "expiration"
    t.integer  "showtime_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "orders", ["showtime_id"], name: "index_orders_on_showtime_id", using: :btree

  create_table "screens", force: :cascade do |t|
    t.integer  "theater_id"
    t.integer  "movie_id"
    t.integer  "number"
    t.integer  "capacity"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "screens", ["movie_id"], name: "index_screens_on_movie_id", using: :btree
  add_index "screens", ["theater_id"], name: "index_screens_on_theater_id", using: :btree

  create_table "showtimes", force: :cascade do |t|
    t.integer  "movie_id"
    t.time     "time"
    t.integer  "screen_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "showtimes", ["movie_id"], name: "index_showtimes_on_movie_id", using: :btree
  add_index "showtimes", ["screen_id"], name: "index_showtimes_on_screen_id", using: :btree

  create_table "theaters", force: :cascade do |t|
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders", "showtimes"
  add_foreign_key "screens", "movies"
  add_foreign_key "screens", "theaters"
  add_foreign_key "showtimes", "movies"
  add_foreign_key "showtimes", "screens"
end
