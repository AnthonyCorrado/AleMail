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

ActiveRecord::Schema.define(version: 20140817232949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: true do |t|
    t.string   "name"
    t.string   "brewery"
    t.string   "style"
    t.string   "comments"
    t.string   "brewery_location"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "patron_id"
  end

  create_table "my_beer_lists", force: true do |t|
    t.integer  "patron_id"
    t.integer  "beer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "integer"
  end

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.integer  "beer_id"
    t.integer  "patron_id"
    t.string   "message_content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patrons", force: true do |t|
    t.string   "last_name"
    t.string   "first_name"
    t.boolean  "text_updates"
    t.string   "phone"
    t.boolean  "email_updates"
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "beer_id"
    t.integer  "beer_id_two"
    t.integer  "beer_id_three"
  end

  create_table "users", force: true do |t|
    t.string   "bar_name"
    t.string   "username"
    t.string   "password_digest"
    t.string   "phone"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
