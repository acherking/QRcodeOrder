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

ActiveRecord::Schema.define(version: 20150607064806) do

  create_table "authentications", force: true do |t|
    t.string   "authentication_str"
    t.integer  "table_id"
    t.boolean  "statu",              default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["authentication_str"], name: "index_authentications_on_authentication_str", unique: true

  create_table "food_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foods", force: true do |t|
    t.integer  "food_type_id"
    t.string   "name"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "status",       default: true
  end

  create_table "little_menus", force: true do |t|
    t.integer  "menu_id"
    t.integer  "food_id"
    t.integer  "number",     default: 0
    t.string   "remark",     default: "None"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "menus", force: true do |t|
    t.integer  "authentication_id"
    t.boolean  "statu",             default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tables", force: true do |t|
    t.string   "name"
    t.boolean  "statu",             default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "authentication_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.boolean  "admin",           default: false
    t.boolean  "zhuachuan",       default: false
    t.boolean  "chuancai",        default: false
    t.boolean  "huanzhuo",        default: false
    t.boolean  "maidan",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "liangcai",        default: false
    t.boolean  "jiushui",         default: false
    t.boolean  "zhuchang",        default: false
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
