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

ActiveRecord::Schema.define(:version => 20140825185020) do

  create_table "aggregations", :force => true do |t|
    t.string   "familycomposition"
    t.integer  "familysize"
    t.decimal  "house_cost",         :precision => 8, :scale => 2
    t.decimal  "childcare_cost",     :precision => 8, :scale => 2
    t.decimal  "health_cost",        :precision => 8, :scale => 2
    t.decimal  "food_cost",          :precision => 8, :scale => 2
    t.decimal  "trans_cost",         :precision => 8, :scale => 2
    t.decimal  "other_cost",         :precision => 8, :scale => 2
    t.decimal  "income",             :precision => 8, :scale => 2
    t.decimal  "income_pretax",      :precision => 8, :scale => 2
    t.decimal  "tax",                :precision => 8, :scale => 2
    t.decimal  "poverty",            :precision => 8, :scale => 2
    t.decimal  "minwage_hrly",       :precision => 8, :scale => 2
    t.decimal  "minwage",            :precision => 8, :scale => 2
    t.decimal  "income_hrly",        :precision => 8, :scale => 2
    t.decimal  "income_pretax_hrly", :precision => 8, :scale => 2
    t.integer  "poverty_hrly"
    t.integer  "explainable_id"
    t.string   "explainable_type"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  create_table "counties", :primary_key => "census_id", :force => true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "geographies", :force => true do |t|
    t.string   "name"
    t.string   "geography_type"
    t.integer  "census_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "metros", :primary_key => "census_id", :force => true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "occupations", :force => true do |t|
    t.string   "occ_type"
    t.integer  "occ_salary"
    t.integer  "explainable_id"
    t.string   "explainable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "states", :primary_key => "census_id", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
