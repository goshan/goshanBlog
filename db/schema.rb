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

ActiveRecord::Schema.define(:version => 20140116060259) do

  create_table "admins", :force => true do |t|
    t.string   "name",                :null => false
    t.string   "birthday"
    t.string   "company"
    t.string   "title"
    t.string   "qq"
    t.string   "weibo"
    t.string   "wechat"
    t.string   "mail"
    t.string   "status"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "blog_types", :force => true do |t|
    t.string   "name",                       :null => false
    t.string   "desc"
    t.integer  "blogs_count", :default => 0
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "blogs", :force => true do |t|
    t.integer  "blog_type_id", :default => 0
    t.string   "title",                       :null => false
    t.text     "text",                        :null => false
    t.integer  "read_cnt",     :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

end
