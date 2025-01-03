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

ActiveRecord::Schema.define(version: 2024_11_13_031703) do

  create_table "game_histories", force: :cascade do |t|
    t.integer "game_id", null: false
    t.integer "user_id", null: false
    t.datetime "date_played"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_game_history_id"
    t.index ["game_id"], name: "index_game_histories_on_game_id"
    t.index ["user_id"], name: "index_game_histories_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "num_players"
    t.integer "num_sides"
    t.integer "num_dice"
    t.string "result"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_games_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "game_histories", "games"
  add_foreign_key "game_histories", "users"
  add_foreign_key "games", "users"
end
