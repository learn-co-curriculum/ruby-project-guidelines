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

ActiveRecord::Schema.define(version: 2020_10_22_224757) do

  create_table "events", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "url"
    t.datetime "date"
    t.integer "price"
    t.boolean "family_friendly"
    t.string "genre"
    t.string "venue_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "genre"
    t.string "city"
    t.float "min_price"
    t.float "max_price"
    t.string "state"
    t.integer "postal_code"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "state"
    t.string "city"
    t.integer "postal_code"
    t.string "venue_id"
  end

end
