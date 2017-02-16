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

ActiveRecord::Schema.define(version: 20170216211612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string   "email",       null: false
    t.string   "name",        null: false
    t.string   "credit_card", null: false
    t.date     "expiration",  null: false
    t.integer  "showtime_id", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "orders", ["showtime_id"], name: "index_orders_on_showtime_id", using: :btree

  create_table "screens", force: :cascade do |t|
    t.integer  "theater_id",  null: false
    t.integer  "movie_id"
    t.integer  "number",      null: false
    t.integer  "capacity",    null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "screens", ["movie_id"], name: "index_screens_on_movie_id", using: :btree
  add_index "screens", ["theater_id"], name: "index_screens_on_theater_id", using: :btree

  create_table "showtimes", force: :cascade do |t|
    t.integer  "movie_id",   null: false
    t.time     "time",       null: false
    t.integer  "screen_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "showtimes", ["movie_id"], name: "index_showtimes_on_movie_id", using: :btree
  add_index "showtimes", ["screen_id"], name: "index_showtimes_on_screen_id", using: :btree

  create_table "theaters", force: :cascade do |t|
    t.string   "address",    null: false
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.float    "price",       null: false
    t.integer  "showtime_id", null: false
    t.string   "name",        null: false
    t.string   "email",       null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "order_id",    null: false
  end

  add_index "tickets", ["order_id"], name: "index_tickets_on_order_id", using: :btree
  add_index "tickets", ["showtime_id"], name: "index_tickets_on_showtime_id", using: :btree

  add_foreign_key "orders", "showtimes"
  add_foreign_key "screens", "movies"
  add_foreign_key "screens", "theaters"
  add_foreign_key "showtimes", "movies"
  add_foreign_key "showtimes", "screens"
  add_foreign_key "tickets", "orders"
  add_foreign_key "tickets", "showtimes"
end
