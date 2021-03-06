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

ActiveRecord::Schema.define(version: 20131223002023) do

  create_table "friends", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friends", ["game_id"], name: "index_friends_on_game_id"

  create_table "game_invitations", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "game_invitations", ["game_id"], name: "index_game_invitations_on_game_id"
  add_index "game_invitations", ["user_id"], name: "index_game_invitations_on_user_id"

  create_table "game_participants", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "game_participants", ["game_id"], name: "index_game_participants_on_game_id"
  add_index "game_participants", ["user_id"], name: "index_game_participants_on_user_id"

  create_table "games", force: true do |t|
    t.string   "name"
    t.date     "scheduled_on"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "games", ["user_id"], name: "index_games_on_user_id"

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

end
