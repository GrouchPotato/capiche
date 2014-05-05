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

ActiveRecord::Schema.define(version: 20140505033008) do

  create_table "conditions", force: true do |t|
    t.integer  "conditionable_id"
    t.string   "conditionable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "input_key"
    t.string   "comparator"
  end

  add_index "conditions", ["conditionable_type", "conditionable_id"], name: "index_conditions_on_conditionable_type_and_conditionable_id", using: :btree

  create_table "questions", force: true do |t|
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "text"
    t.string   "key"
    t.string   "type"
  end

  create_table "subjects", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "title"
    t.text     "intro"
    t.text     "outcome"
  end

  add_index "subjects", ["slug"], name: "index_subjects_on_slug", using: :btree

end
