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

ActiveRecord::Schema.define(:version => 20140107042650) do

  create_table "key_values", :force => true do |t|
    t.string   "key"
    t.text     "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "picture"
    t.integer  "sort_order"
    t.boolean  "published",  :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "project_pictures", :force => true do |t|
    t.string   "picture"
    t.integer  "sort_order"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "subtitle"
    t.string   "description"
    t.string   "slug"
    t.integer  "sort_order"
    t.string   "featured_project_picture"
    t.string   "cover_picture"
    t.string   "slider_picture"
    t.boolean  "published",                :default => false
    t.boolean  "in_slider",                :default => false
    t.boolean  "featured",                 :default => false
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.string   "cover_cols"
    t.string   "cover_title"
    t.integer  "slider_order"
    t.integer  "featured_order"
  end

  create_table "translations", :force => true do |t|
    t.string  "locale"
    t.string  "key"
    t.text    "value"
    t.text    "interpolations"
    t.boolean "is_proc",        :default => false
    t.boolean "stale",          :default => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

end
