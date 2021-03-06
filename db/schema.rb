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
    t.string   "profession"
    t.text     "description"
    t.string   "resume_link"
    t.string   "image"
    t.text     "fields",      default: [],                 array: true
    t.boolean  "paired",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "applicants", ["user_id"], name: "index_applicants_on_user_id", using: :btree

  create_table "bookmarks", force: :cascade do |t|
    t.integer "applicant_id"
    t.integer "job_id"
  end

  add_index "bookmarks", ["applicant_id"], name: "index_bookmarks_on_applicant_id", using: :btree
  add_index "bookmarks", ["job_id"], name: "index_bookmarks_on_job_id", using: :btree

  create_table "employers", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.text     "description"
    t.string   "linkedIn_profile"
    t.text     "positions_offered"
    t.string   "image"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "employers", ["user_id"], name: "index_employers_on_user_id", using: :btree

  create_table "job_tags", force: :cascade do |t|
    t.integer "job_id"
    t.integer "tag_id"
  end

  add_index "job_tags", ["job_id"], name: "index_job_tags_on_job_id", using: :btree
  add_index "job_tags", ["tag_id"], name: "index_job_tags_on_tag_id", using: :btree

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
    t.integer  "applicant_id"
    t.integer  "student_id"
    t.text     "summary_story"
    t.text     "story"
    t.boolean  "story_on_display", default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "pairs", ["applicant_id"], name: "index_pairs_on_applicant_id", using: :btree
  add_index "pairs", ["student_id"], name: "index_pairs_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "image"
    t.text     "reason"
    t.string   "resume_link"
    t.boolean  "paired",      default: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
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
