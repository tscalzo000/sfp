ActiveRecord::Schema.define(version: 20170130230338) do

  enable_extension "plpgsql"

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
    t.string   "type",        default: "", null: false
    t.string   "location",    default: "", null: false
    t.string   "time",                     null: false
    t.string   "day",                      null: false
    t.string   "frequency",                null: false
    t.string   "cover"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
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
