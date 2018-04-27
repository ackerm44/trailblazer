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

ActiveRecord::Schema.define(version: 20180427182533) do

  create_table "answers", force: :cascade do |t|
    t.string "title"
    t.integer "question_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "unread", default: true
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lists_trails", id: false, force: :cascade do |t|
    t.integer "list_id"
    t.integer "trail_id"
    t.index ["list_id"], name: "index_lists_trails_on_list_id"
    t.index ["trail_id"], name: "index_lists_trails_on_trail_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.integer "trail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tips", force: :cascade do |t|
    t.string "comment"
    t.integer "user_id"
    t.integer "trail_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trails", force: :cascade do |t|
    t.string "name"
    t.string "nearest_city"
    t.string "directions"
    t.float "distance"
    t.text "description"
    t.string "features"
    t.boolean "dog_friendly"
    t.boolean "user_submitted"
    t.integer "region_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "photo"
  end

  create_table "trails_users", id: false, force: :cascade do |t|
    t.integer "trail_id"
    t.integer "user_id"
    t.index ["trail_id"], name: "index_trails_users_on_trail_id"
    t.index ["user_id"], name: "index_trails_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
