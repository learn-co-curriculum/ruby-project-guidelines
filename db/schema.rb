# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_09_155435) do

  create_table "cryptos", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.integer "rank"
    t.float "price"
    t.float "percent_change_1hr"
    t.float "percent_change_24hr"
    t.float "percent_change_7d"
  end

  create_table "favorites", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "symbol"
    t.integer "crypto_id"
    t.integer "user_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.integer "user_id"
  end

  create_table "trades", force: :cascade do |t|
    t.integer "portfolio_id"
    t.integer "crypto_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "user_name"
    t.string "password"
  end

end
