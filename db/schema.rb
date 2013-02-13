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

ActiveRecord::Schema.define(:version => 20130213141355) do

  create_table "assessments", :force => true do |t|
    t.string   "state"
    t.string   "county"
    t.string   "municipality"
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
    t.integer  "modifier"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "counties", :force => true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "muni_codes", :force => true do |t|
    t.string   "county"
    t.string   "city"
    t.integer  "muni_code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "properties", :force => true do |t|
    t.integer  "tax_year"
    t.string   "county"
    t.string   "state"
    t.string   "district"
    t.string   "last_updated"
    t.string   "owner_name"
    t.string   "owner_street"
    t.string   "owner_city_state"
    t.string   "owner_zip_code"
    t.string   "property_location"
    t.float    "acerage"
    t.integer  "year_constructed"
    t.integer  "building_square_feet"
    t.float    "land_value"
    t.float    "improvement_value"
    t.float    "net_taxable_value"
    t.float    "prior_year_tax"
    t.float    "curret_year_tax"
    t.float    "sale_price_one"
    t.string   "deed_date_one"
    t.float    "sale_price_two"
    t.string   "deed_date_two"
    t.float    "sale_price_three"
    t.string   "deed_date_three"
    t.float    "sale_price_four"
    t.string   "deed_date_four"
    t.float    "sale_price_five"
    t.string   "deed_date_five"
    t.float    "sale_price_six"
    t.string   "deed_date_six"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "searches", :force => true do |t|
    t.string   "county"
    t.string   "state"
    t.string   "district"
    t.integer  "min_price"
    t.integer  "max_price"
    t.integer  "min_sq_ft"
    t.integer  "max_taxes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
