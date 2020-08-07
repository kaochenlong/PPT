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

ActiveRecord::Schema.define(version: 2020_08_07_024934) do

  create_table "board_masters", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "board_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["board_id"], name: "index_board_masters_on_board_id"
    t.index ["user_id"], name: "index_board_masters_on_user_id"
  end

  create_table "boards", force: :cascade do |t|
    t.string "title"
    t.text "intro"
    t.datetime "deleted_at"
    t.string "state", default: "normal"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deleted_at"], name: "index_boards_on_deleted_at"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.integer "board_id", null: false
    t.datetime "deleted_at"
    t.string "ip_address"
    t.string "serial"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.index ["board_id"], name: "index_posts_on_board_id"
    t.index ["deleted_at"], name: "index_posts_on_deleted_at"
    t.index ["serial"], name: "index_posts_on_serial", unique: true
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "account"
    t.string "password"
    t.string "email"
    t.string "nickname"
    t.string "state", default: "normal"
    t.datetime "deleted_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "gender"
    t.index ["account"], name: "index_users_on_account", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "board_masters", "boards"
  add_foreign_key "board_masters", "users"
  add_foreign_key "posts", "boards"
end
