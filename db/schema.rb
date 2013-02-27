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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130227030833) do

  create_table "assessments", :force => true do |t|
    t.integer  "state_id"
    t.integer  "county_id"
    t.integer  "city_code"
    t.string   "property_location"
    t.string   "property_class"
    t.string   "owner_name"
    t.string   "owner_mailing"
    t.string   "city_state_zip"
    t.integer  "square_feet"
    t.integer  "year_built"
    t.string   "building_class"
    t.string   "updated"
    t.float    "acreage"
    t.float    "taxes_one"
    t.float    "taxes_two"
    t.float    "taxes_three"
    t.float    "taxes_four"
    t.string   "sale_date"
    t.float    "sale_price"
    t.float    "assessed"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "cities", :force => true do |t|
    t.integer  "county_id"
    t.string   "name"
    t.integer  "city_code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "counties", :force => true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "searches", :force => true do |t|
    t.integer  "state_id"
    t.integer  "county_id"
    t.integer  "city_code"
    t.integer  "min_price"
    t.integer  "max_price"
    t.integer  "min_sq_ft"
    t.integer  "max_taxes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sellers", :force => true do |t|
    t.integer  "state_id"
    t.integer  "county_id"
    t.integer  "city_id"
    t.string   "property_location"
    t.date     "move_date"
    t.string   "owner_name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
