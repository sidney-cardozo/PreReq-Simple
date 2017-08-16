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

ActiveRecord::Schema.define(version: 20170812001511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicants", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.text     "description"
    t.string   "resume_link"
    t.string   "image"
    t.text     "fields",       default: [],              array: true
    t.boolean  "paired"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "applicants", ["user_id"], name: "index_applicants_on_user_id", using: :btree

  create_table "employers", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "employers", ["user_id"], name: "index_employers_on_user_id", using: :btree

  create_table "job_tags", force: :cascade do |t|
    t.integer "jobs_id"
    t.integer "tags_id"
  end

  add_index "job_tags", ["jobs_id"], name: "index_job_tags_on_jobs_id", using: :btree
  add_index "job_tags", ["tags_id"], name: "index_job_tags_on_tags_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.integer  "employer_id"
    t.string   "position"
    t.text     "description"
    t.text     "requirements"
    t.string   "job_type"
    t.text     "apply_info"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "jobs", ["employer_id"], name: "index_jobs_on_employer_id", using: :btree

  create_table "pairs", force: :cascade do |t|
    t.integer  "applicants_id"
    t.integer  "students_id"
    t.text     "story"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "pairs", ["applicants_id"], name: "index_pairs_on_applicants_id", using: :btree
  add_index "pairs", ["students_id"], name: "index_pairs_on_students_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "concentration"
    t.string   "industry"
    t.string   "resume_link"
    t.boolean  "paired"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string  "email"
    t.string  "password_digest"
    t.integer "role"
  end

end
