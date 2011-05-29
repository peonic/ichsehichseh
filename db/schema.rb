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

ActiveRecord::Schema.define(:version => 20110529124613) do

  create_table "participants", :force => true do |t|
    t.string   "name",       :limit => 100, :null => false
    t.string   "email",      :limit => 100, :null => false
    t.string   "street",     :limit => 42,  :null => false
    t.string   "town",       :limit => 42,  :null => false
    t.string   "zip",        :limit => 5,   :null => false
    t.string   "telephone",  :limit => 20,  :null => false
    t.string   "storyname",  :limit => 42,  :null => false
    t.string   "password",   :limit => 42,  :null => false
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "upload_items", :force => true do |t|
    t.integer  "participant_id",      :null => false
    t.string   "title"
    t.string   "upload_content_type"
    t.string   "upload_file_name"
    t.integer  "upload_file_size"
    t.integer  "width"
    t.integer  "height"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                :limit => 100,                :null => false
    t.string   "birthday",                                          :null => false
    t.string   "street",              :limit => 42,                 :null => false
    t.string   "city",                :limit => 42,                 :null => false
    t.string   "zip",                 :limit => 5,                  :null => false
    t.string   "telephone",           :limit => 20,                 :null => false
    t.string   "storyname",           :limit => 42,                 :null => false
    t.text     "comment"
    t.string   "email",                                             :null => false
    t.string   "crypted_password",                                  :null => false
    t.string   "password_salt",                                     :null => false
    t.string   "persistence_token",                                 :null => false
    t.string   "single_access_token",                               :null => false
    t.string   "perishable_token",                                  :null => false
    t.integer  "login_count",                        :default => 0, :null => false
    t.integer  "failed_login_count",                 :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
  end

end
