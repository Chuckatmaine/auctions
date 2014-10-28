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

ActiveRecord::Schema.define(version: 20141027155500) do

  create_table "auctioneers", force: true do |t|
    t.integer  "user_id"
    t.integer  "auction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auctions", force: true do |t|
    t.string   "title",             default: "",    null: false
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean  "display",           default: false
    t.text     "winner_message",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "bids", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.float    "amount",     limit: 24
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "qty"
  end

  create_table "items", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.float    "start_bid",            limit: 24
    t.float    "bid_increment",        limit: 24
    t.integer  "auction_id"
    t.boolean  "is_donation"
    t.boolean  "buyitnow"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "qty"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "street"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.boolean  "is_admin"
    t.boolean  "is_auctioneer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
