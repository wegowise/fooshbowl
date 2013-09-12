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

ActiveRecord::Schema.define(version: 20130911234013) do

  create_table "games", force: true do |t|
    t.integer  "player1_id"
    t.integer  "player2_id"
    t.integer  "player1_score"
    t.integer  "player2_score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",          default: "Game"
    t.integer  "round"
    t.integer  "child_game_id"
    t.integer  "tournament_id"
    t.integer  "season_id"
  end

  add_index "games", ["player1_id"], name: "index_games_on_player1_id"
  add_index "games", ["player2_id"], name: "index_games_on_player2_id"

  create_table "players", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
