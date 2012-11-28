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

ActiveRecord::Schema.define(:version => 20121128120759) do

  create_table "application_pages", :force => true do |t|
    t.string   "location",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "application_pages", ["location"], :name => "index_application_pages_on_location"

  create_table "learning_spaces", :force => true do |t|
    t.string   "id_hash",         :null => false
    t.string   "name",            :null => false
    t.integer  "organization_id", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "learning_spaces", ["id_hash"], :name => "index_learning_spaces_on_id_hash", :unique => true
  add_index "learning_spaces", ["organization_id"], :name => "index_learning_spaces_on_organization_id"

  create_table "memberships", :force => true do |t|
    t.integer  "user_id",           :null => false
    t.integer  "learning_space_id", :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "memberships", ["user_id", "learning_space_id"], :name => "index_memberships_on_user_id_and_learning_space_id", :unique => true

  create_table "organizations", :force => true do |t|
    t.string   "id_hash",    :null => false
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "organizations", ["id_hash"], :name => "index_organizations_on_id_hash", :unique => true
  add_index "organizations", ["name"], :name => "index_organizations_on_name", :unique => true

  create_table "pages", :force => true do |t|
    t.string   "title",         :null => false
    t.text     "content"
    t.integer  "pageable_id"
    t.string   "pageable_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "profiles", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id", :unique => true

  create_table "roles", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["name"], :name => "index_roles_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name",                   :default => "", :null => false
    t.string   "id_hash",                                :null => false
    t.integer  "organization_id",        :default => 0,  :null => false
    t.string   "role",                   :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["id_hash"], :name => "index_users_on_id_hash", :unique => true
  add_index "users", ["organization_id"], :name => "index_users_on_organization_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
