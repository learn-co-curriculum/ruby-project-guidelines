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

ActiveRecord::Schema.define(version: 5) do

  create_table "ingredient_recipes", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "recipe_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "type"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.string "ingredient_1"
    t.string "measurement_1"
    t.string "ingredient_2"
    t.string "measurement_2"
    t.string "ingredient_3"
    t.string "measurement_3"
    t.string "ingredient_4"
    t.string "measurement_4"
    t.string "ingredient_5"
    t.string "measurement_5"
    t.text "instructions"
  end

  create_table "user_recipes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.integer "rating"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
  end

end
