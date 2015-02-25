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

  create_table "apps", force: :cascade do |t|
    t.string   "key",         limit: 255
    t.string   "identifier",  limit: 255
    t.string   "environment", limit: 255
    t.string   "password",    limit: 255
    t.text     "certificate", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "devices", force: :cascade do |t|
    t.string   "identifier",  limit: 255
    t.string   "token",       limit: 255
    t.string   "app_id",      limit: 255
    t.datetime "last_access"
    t.float    "lat",         limit: 53
    t.float    "lon",         limit: 53
    t.string   "locale",      limit: 255
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "receiver_id", limit: 255
    t.integer  "sender_id",   limit: 4
    t.string   "category",    limit: 255
    t.string   "title",       limit: 255
    t.string   "question",    limit: 255
    t.string   "reply",       limit: 255
    t.boolean  "deleted",     limit: 1
    t.boolean  "sent",        limit: 1
    t.boolean  "received",    limit: 1
    t.boolean  "red",         limit: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "url",         limit: 255
    t.integer  "badge",       limit: 4
    t.string   "sound",       limit: 255
  end

end
