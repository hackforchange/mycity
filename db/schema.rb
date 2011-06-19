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

ActiveRecord::Schema.define(:version => 20110619132051) do

  create_table "issues", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "tag"
    t.string   "longitude"
    t.string   "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "issues", ["latitude"], :name => "index_issues_on_latitude"
  add_index "issues", ["longitude"], :name => "index_issues_on_longitude"
  add_index "issues", ["tag"], :name => "index_issues_on_tag"

  create_table "users", :force => true do |t|
    t.string   "email",                    :null => false
    t.string   "database_authenticatable", :null => false
    t.string   "recoverable"
    t.string   "rememberable"
    t.string   "trackable"
    t.string   "token_authenticatable"
    t.string   "reset_password_token"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "issue_id"
  end

end
