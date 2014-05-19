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

ActiveRecord::Schema.define(:version => 20140518193901) do

  create_table "aggregations", :force => true do |t|
    t.string   "familycomposition"
    t.integer  "familysize"
    t.integer  "house_cost"
    t.integer  "childcare_cost"
    t.integer  "health_cost"
    t.integer  "food_cost"
    t.integer  "trans_cost"
    t.integer  "other_cost"
    t.integer  "income"
    t.integer  "income_pretax"
    t.integer  "tax"
    t.integer  "poverty"
    t.integer  "minwage_hrly"
    t.integer  "minwage"
    t.integer  "income_hrly"
    t.integer  "income_pretax_hrly"
    t.integer  "poverty_hrly"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "explainable_id"
    t.string   "explainable_type"
  end

  create_table "counties", :force => true do |t|
    t.integer  "state_id"
    t.integer  "countyfips"
    t.string   "countyname"
    t.string   "geography"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "counties", ["state_id"], :name => "index_counties_on_state_id"

  create_table "counties_metros", :force => true do |t|
    t.integer "county_id"
    t.integer "metro_id"
  end

  add_index "counties_metros", ["county_id", "metro_id"], :name => "index_counties_metros_on_county_id_and_metro_id"

  create_table "metros", :force => true do |t|
    t.integer  "state_id"
    t.integer  "cbsa"
    t.string   "cbsa_name"
    t.string   "geography"
    t.string   "state2"
    t.string   "state3"
    t.string   "state4"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "metros", ["state_id"], :name => "index_metros_on_state_id"

  create_table "metros_counties", :force => true do |t|
    t.integer "metro_id"
    t.integer "county_id"
  end

  add_index "metros_counties", ["metro_id", "county_id"], :name => "index_metros_counties_on_metro_id_and_county_id"

  create_table "occupations", :force => true do |t|
    t.string  "occ_type"
    t.integer "occ_salary"
    t.string  "geography"
    t.integer "explainable_id"
    t.string  "explainable_type"
  end

  create_table "states", :force => true do |t|
    t.string   "region_id"
    t.integer  "statefips"
    t.string   "state_name"
    t.string   "geography"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "states", ["region_id"], :name => "index_states_on_region_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
