# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091116174110) do

  create_table "concepts", :force => true do |t|
    t.text    "scope"
    t.text    "definition"
    t.text    "example"
    t.text    "glossary_name"
    t.boolean "is_free",       :null => false
  end

  create_table "translations", :force => true do |t|
    t.text    "text"
    t.text    "language"
    t.boolean "recommended"
    t.text    "partofspeech"
    t.text    "grammaticalgender"
    t.text    "grammaticalnumber"
    t.integer "concept_id"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
