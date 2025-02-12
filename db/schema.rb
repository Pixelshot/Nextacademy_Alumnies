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

ActiveRecord::Schema.define(version: 20151215070010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "newstables", force: :cascade do |t|
    t.string   "title"
    t.string   "body"
    t.json     "images"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "poster_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "contact_email"
    t.string   "login_email"
    t.string   "password_digest"
    t.string   "fb"
    t.string   "linkedin"
    t.string   "twitter"
    t.string   "github"
    t.string   "batch_month"
    t.string   "batch_year"
    t.string   "projects_link"
    t.string   "description"
    t.string   "avatar"
    t.string   "status"
    t.string   "slack_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
  end

end
