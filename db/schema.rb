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

ActiveRecord::Schema.define(version: 20130625152115) do

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.string   "suite"
    t.string   "city"
    t.string   "region"
    t.string   "post_code"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: true do |t|
    t.string  "name",             null: false
    t.date    "date"
    t.string  "url",              null: false
    t.integer "event_address_id"
    t.string  "sport"
    t.text    "notes"
    t.string  "slug"
    t.text    "description"
  end

  create_table "non_profits", force: true do |t|
    t.string "name",        null: false
    t.string "tax_id"
    t.string "url",         null: false
    t.string "slug"
    t.text   "description"
    t.text   "notes"
  end

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories"

  create_table "users", force: true do |t|
    t.string   "first_name",                                   null: false
    t.string   "last_name",                                    null: false
    t.string   "gender",                 limit: 1
    t.date     "date_of_birth"
    t.string   "email",                                        null: false
    t.string   "phone"
    t.string   "employer_name"
    t.integer  "event_id"
    t.integer  "non_profit_id"
    t.string   "encrypted_password",                           null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                    default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "home_address_id"
    t.integer  "work_address_id"
    t.string   "slug",                                         null: false
    t.datetime "accepted_terms_at"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true

end
