# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_09_141253) do

  create_table "bookings", force: :cascade do |t|
    t.integer "passengers_id", null: false
    t.integer "flightofferings_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flightofferings_id"], name: "index_bookings_on_flightofferings_id"
    t.index ["passengers_id"], name: "index_bookings_on_passengers_id"
  end

  create_table "flightofferings", force: :cascade do |t|
    t.integer "passenger_capacity", null: false
    t.string "departure_location"
    t.string "arrival_location"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "flightofferings", column: "flightofferings_id"
  add_foreign_key "bookings", "passengers", column: "passengers_id"
end
