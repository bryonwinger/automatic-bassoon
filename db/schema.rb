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

ActiveRecord::Schema.define(version: 20170304181419) do

  create_table "articles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "documentable_id"
    t.string   "documentable_type"
    t.index ["documentable_type", "documentable_id"], name: "index_articles_on_documentable_type_and_documentable_id"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "circuits", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "difficulty"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "submitter_id"
    t.index ["submitter_id"], name: "index_circuits_on_submitter_id"
  end

  create_table "circuits_effect_types", id: false, force: :cascade do |t|
    t.integer "circuit_id",     null: false
    t.integer "effect_type_id", null: false
  end

  create_table "effect_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_circuit_favorites", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "circuit_id"
    t.index ["circuit_id"], name: "index_user_circuit_favorites_on_circuit_id"
    t.index ["user_id"], name: "index_user_circuit_favorites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "username"
    t.index ["username"], name: "index_users_on_username"
  end

end
