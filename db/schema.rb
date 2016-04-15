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

ActiveRecord::Schema.define(version: 20160415095159) do

  create_table "access_logins", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "client_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "access_logins", ["client_id"], name: "index_access_logins_on_client_id"
  add_index "access_logins", ["role_id"], name: "index_access_logins_on_role_id"
  add_index "access_logins", ["user_id"], name: "index_access_logins_on_user_id"

  create_table "api_keys", force: :cascade do |t|
    t.string   "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.integer  "role_id"
    t.integer  "client_id"
    t.integer  "ttl"
  end

  add_index "api_keys", ["client_id"], name: "index_api_keys_on_client_id"
  add_index "api_keys", ["role_id"], name: "index_api_keys_on_role_id"
  add_index "api_keys", ["user_id"], name: "index_api_keys_on_user_id"

  create_table "artikels", force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "app_id"
    t.string   "app_secret"
    t.string   "app_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.integer  "client_id"
    t.string   "name",       limit: 30
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "roles", ["client_id"], name: "index_roles_on_client_id"
  add_index "roles", ["name"], name: "index_roles_on_name", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "magic_word"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
