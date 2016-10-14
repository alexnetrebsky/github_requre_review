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

ActiveRecord::Schema.define(version: 20161014064450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "github_branches", force: :cascade do |t|
    t.string   "name"
    t.integer  "github_repository_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "github_events", force: :cascade do |t|
    t.string   "payload"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "github_repositories", force: :cascade do |t|
    t.string   "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "account_id", null: false
  end

  create_table "test_result_items", force: :cascade do |t|
    t.string   "status"
    t.integer  "test_result_id"
    t.string   "description"
    t.string   "key"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "test_results", force: :cascade do |t|
    t.string   "status"
    t.integer  "github_branch_id"
    t.integer  "gihub_pull_request"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_foreign_key "github_branches", "github_repositories"
  add_foreign_key "github_repositories", "accounts"
  add_foreign_key "test_result_items", "test_results"
  add_foreign_key "test_results", "github_branches"
end
