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

ActiveRecord::Schema.define(version: 20150225172637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apps", force: :cascade do |t|
    t.string   "key"
    t.string   "identifier"
    t.string   "environment"
    t.string   "password"
    t.text     "certificate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string   "identifier"
    t.string   "token"
    t.string   "app_id"
    t.datetime "last_access"
    t.float    "lat"
    t.float    "lon"
    t.string   "locale"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "receiver_id"
    t.integer  "sender_id"
    t.string   "category"
    t.string   "title"
    t.string   "question"
    t.string   "reply"
    t.boolean  "deleted"
    t.boolean  "sent"
    t.boolean  "received"
    t.boolean  "red"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "url"
    t.integer  "badge"
    t.string   "sound"
  end

end
