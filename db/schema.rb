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

ActiveRecord::Schema.define(version: 20170208185828) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "charactersheets", force: :cascade do |t|
    t.integer "user_id",     null: false
    t.string  "name"
    t.string  "race"
    t.string  "age"
    t.string  "alignment"
    t.string  "classtype"
    t.integer "level"
    t.string  "abilities"
    t.string  "description"
    t.string  "backstory"
    t.string  "appearance"
    t.string  "languages"
    t.string  "equipment"
    t.string  "weapons"
    t.string  "spells"
    t.string  "gold"
    t.string  "other"
    t.index ["user_id"], name: "index_charactersheets_on_user_id", using: :btree
  end

  create_table "charviews", force: :cascade do |t|
    t.integer "charactersheet_id"
    t.integer "user_id"
    t.index ["charactersheet_id"], name: "index_charviews_on_charactersheet_id", using: :btree
    t.index ["user_id"], name: "index_charviews_on_user_id", using: :btree
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.integer  "user_id",    null: false
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_comments_on_game_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.string   "name",        default: "", null: false
    t.string   "description", default: "", null: false
    t.integer  "playernum",                null: false
    t.integer  "dm_id",                    null: false
    t.string   "gametype",    default: "", null: false
    t.string   "location",    default: "", null: false
    t.string   "time",                     null: false
    t.string   "day",                      null: false
    t.string   "frequency",                null: false
    t.string   "cover"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "other"
    t.float    "lat"
    t.float    "lng"
  end

  create_table "notes", force: :cascade do |t|
    t.integer  "game_id",    null: false
    t.integer  "user_id",    null: false
    t.string   "title",      null: false
    t.string   "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_notes_on_game_id", using: :btree
    t.index ["user_id"], name: "index_notes_on_user_id", using: :btree
  end

  create_table "requests", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "game_id",    null: false
    t.text     "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_requests_on_game_id", using: :btree
    t.index ["user_id"], name: "index_requests_on_user_id", using: :btree
  end

  create_table "signups", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "game_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_signups_on_game_id", using: :btree
    t.index ["user_id"], name: "index_signups_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",            default: "", null: false
    t.string   "email",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

end
