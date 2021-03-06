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

ActiveRecord::Schema.define(version: 20160221082240) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hacker_languages", force: :cascade do |t|
    t.integer  "hacker_id"
    t.integer  "language_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "hacker_languages", ["hacker_id"], name: "index_hacker_languages_on_hacker_id", using: :btree
  add_index "hacker_languages", ["language_id"], name: "index_hacker_languages_on_language_id", using: :btree

  create_table "hackers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gravatar_url"
  end

  add_index "hackers", ["email"], name: "index_hackers_on_email", unique: true, using: :btree
  add_index "hackers", ["reset_password_token"], name: "index_hackers_on_reset_password_token", unique: true, using: :btree

  create_table "languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "languages", ["name"], name: "index_languages_on_name", using: :btree

  create_table "mentorships", force: :cascade do |t|
    t.integer  "hacker_id"
    t.integer  "student_id"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "hacker_rating"
    t.integer  "student_rating"
    t.text     "comment"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "language_id"
    t.string   "connection_code"
  end

  add_index "mentorships", ["hacker_id"], name: "index_mentorships_on_hacker_id", using: :btree
  add_index "mentorships", ["language_id"], name: "index_mentorships_on_language_id", using: :btree
  add_index "mentorships", ["student_id"], name: "index_mentorships_on_student_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gravatar_url"
  end

  add_index "students", ["email"], name: "index_students_on_email", unique: true, using: :btree
  add_index "students", ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "hacker_languages", "hackers"
  add_foreign_key "hacker_languages", "languages"
  add_foreign_key "mentorships", "hackers"
  add_foreign_key "mentorships", "languages"
  add_foreign_key "mentorships", "students"
end
