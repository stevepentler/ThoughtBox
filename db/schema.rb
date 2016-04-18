ActiveRecord::Schema.define(version: 20160418170638) do

  create_table "links", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.string   "viewed",     default: "0"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "links", ["user_id"], name: "index_links_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
