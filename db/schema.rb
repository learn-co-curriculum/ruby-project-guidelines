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

ActiveRecord::Schema.define(version: 2021_06_22_153205) do

  create_table "adoptions", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "pet_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.integer "years_experience"
    t.boolean "full_time"
    t.integer "hours_scheduled"
    t.integer "age"
    t.integer "salary"
    t.integer "store_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "nickname"
    t.string "species"
    t.float "weight"
    t.integer "age"
    t.boolean "alive"
    t.integer "years_in_captivity"
    t.float "price"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.string "address"
  end

end
