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

ActiveRecord::Schema.define(version: 20140730125145) do

  create_table "doc_files", force: true do |t|
    t.string   "name"
    t.text     "clarification"
    t.string   "docOwner"
    t.string   "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "families", force: true do |t|
    t.string   "name"
    t.string   "dni"
    t.string   "relationship"
    t.string   "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "luch_petitions", force: true do |t|
    t.string   "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scholarship_petitions", force: true do |t|
    t.string   "student_id"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scholarship_type"
  end

  create_table "scholarships", force: true do |t|
    t.string   "student_id"
    t.date     "starting",         limit: 255
    t.date     "ending",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "scholarship_type"
  end

  create_table "students", force: true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.string   "dni"
    t.string   "career"
    t.string   "otherCareer"
    t.string   "fileNumber"
    t.string   "address"
    t.string   "department"
    t.string   "telephone"
    t.string   "cellphone"
    t.string   "dwelling"
    t.float    "rental"
    t.string   "economicSituation"
    t.integer  "children"
    t.integer  "dependent"
    t.integer  "schoolDays"
    t.integer  "familyGroup"
    t.float    "income"
    t.integer  "minors"
    t.string   "disabilityOrIllness"
    t.text     "clarifications"
    t.integer  "vehicles"
    t.string   "card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_id"
  end

  add_index "students", ["dni"], name: "index_students_on_dni", unique: true
  add_index "students", ["fileNumber"], name: "index_students_on_fileNumber", unique: true

  create_table "users", force: true do |t|
    t.string   "email",                              null: false
    t.string   "username",                           null: false
    t.string   "encrypted_password",                 null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
