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

ActiveRecord::Schema.define(version: 20150815070848) do

  create_table "attachments", force: true do |t|
    t.integer  "parent_id"
    t.string   "parent_type"
    t.string   "file"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachments", ["parent_id"], name: "index_attachments_on_parent_id"

  create_table "engage_states", force: true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "question_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "engage_states", ["post_id"], name: "index_engage_states_on_post_id"
  add_index "engage_states", ["user_id"], name: "index_engage_states_on_user_id"

  create_table "post_ratings", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.float    "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "comment"
  end

  add_index "post_ratings", ["post_id"], name: "index_post_ratings_on_post_id"
  add_index "post_ratings", ["user_id"], name: "index_post_ratings_on_user_id"

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.boolean  "is_complete"
    t.integer  "hunter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["hunter_id"], name: "index_posts_on_hunter_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "questions", force: true do |t|
    t.integer  "post_id"
    t.integer  "number"
    t.text     "content"
    t.string   "answer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["post_id"], name: "index_questions_on_post_id"

  create_table "replies", force: true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "replies", ["post_id"], name: "index_replies_on_post_id"
  add_index "replies", ["user_id"], name: "index_replies_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "profile"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
