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

ActiveRecord::Schema.define(:version => 20111027112336) do

  create_table "klasses", :force => true do |t|
    t.string "name", :null => false
  end

  add_index "klasses", ["name"], :name => "index_klasses_on_name"

  create_table "school_klasses", :force => true do |t|
    t.integer  "school_id",  :null => false
    t.integer  "klass_id",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "school_klasses", ["school_id", "klass_id"], :name => "index_school_klasses_on_school_id_and_klass_id"

  create_table "schools", :force => true do |t|
    t.string   "name",                               :null => false
    t.string   "code",                               :null => false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token",                  :null => false
    t.string   "perishable_token",   :default => "", :null => false
    t.integer  "login_count",        :default => 0,  :null => false
    t.integer  "failed_login_count", :default => 0,  :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "section_students", :force => true do |t|
    t.integer  "section_id", :null => false
    t.integer  "student_id", :null => false
    t.integer  "start_year"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "section_students", ["section_id", "student_id"], :name => "index_section_students_on_section_id_and_student_id"

  create_table "sections", :force => true do |t|
    t.integer  "school_klass_id", :null => false
    t.string   "name",            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sections", ["school_klass_id"], :name => "index_sections_on_school_klass_id"

  create_table "students", :force => true do |t|
    t.string   "first_name"
    t.string   "surname"
    t.date     "dob"
    t.string   "gender"
    t.string   "father_first_name"
    t.string   "father_surname"
    t.string   "mother_first_name"
    t.string   "mother_surname"
    t.string   "gaurdian_first_name"
    t.string   "gaurdian_surname"
    t.string   "caste"
    t.string   "minority"
    t.string   "father_income_source"
    t.string   "father_number"
    t.string   "gaurdian_number"
    t.boolean  "bpl"
    t.string   "aadhar_uid"
    t.text     "current_address"
    t.text     "permanent_address"
    t.boolean  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
