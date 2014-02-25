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

ActiveRecord::Schema.define(version: 20131222021223) do

  create_table "hero_images", force: true do |t|
    t.string   "title"
    t.string   "image"
    t.integer  "user_id"
    t.integer  "hero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hero_images", ["user_id", "hero_id"], name: "index_hero_images_on_user_id_and_hero_id", using: :btree

  create_table "heroes", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "state"
    t.string   "name"
    t.text     "synopsis"
    t.text     "story"
    t.date     "birthdate"
    t.date     "deathdate"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "heroes", ["name", "user_id"], name: "index_heroes_on_name_and_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "name"
    t.text     "post"
    t.integer  "user_id"
    t.integer  "hero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id", "hero_id"], name: "index_posts_on_user_id_and_hero_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "name"
    t.string   "email"
    t.string   "image"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name", "remember_token"], name: "index_users_on_name_and_remember_token", using: :btree

  create_table "videos", force: true do |t|
    t.string   "title"
    t.string   "file"
    t.integer  "user_id"
    t.integer  "hero_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["user_id", "hero_id"], name: "index_videos_on_user_id_and_hero_id", using: :btree

end
