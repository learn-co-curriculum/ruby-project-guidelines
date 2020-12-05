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

ActiveRecord::Schema.define(version: 2020_12_05_203806) do

  create_table "matches", force: :cascade do |t|
    t.datetime "date"
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.integer "home_team_goals"
    t.integer "away_team_goals"
    t.integer "stadium_id"
  end

  create_table "stadiums", force: :cascade do |t|
    t.string "name"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
  end

end
