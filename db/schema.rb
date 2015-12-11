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

ActiveRecord::Schema.define(version: 20151115234655) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "author"
    t.text     "description"
    t.boolean  "confirmed"
    t.boolean  "suggested"
    t.integer  "topic_id"
  end

  add_index "articles", ["topic_id"], name: "index_articles_on_topic_id"

  create_table "coinrates", force: :cascade do |t|
    t.float    "sale"
    t.float    "buy"
    t.date     "todate"
    t.integer  "ratetype_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "coinrates", ["ratetype_id"], name: "index_coinrates_on_ratetype_id"

  create_table "comments", force: :cascade do |t|
    t.text     "content"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.text     "background"
    t.string   "location"
    t.string   "contact_reference"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "nit"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "companygoers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "development_rates", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "exchanges", force: :cascade do |t|
    t.date     "to_date"
    t.integer  "buy_value"
    t.integer  "ratetype_id"
    t.integer  "rateclass_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "coin"
    t.float    "saleprice"
  end

  add_index "exchanges", ["rateclass_id"], name: "index_exchanges_on_rateclass_id"
  add_index "exchanges", ["ratetype_id"], name: "index_exchanges_on_ratetype_id"

  create_table "rate_registers", force: :cascade do |t|
    t.datetime "date_registered"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "country_id"
    t.integer  "development_rate_id"
    t.float    "rate_value"
  end

  add_index "rate_registers", ["country_id"], name: "index_rate_registers_on_country_id"
  add_index "rate_registers", ["development_rate_id"], name: "index_rate_registers_on_development_rate_id"

  create_table "rateclasses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratetypes", force: :cascade do |t|
    t.string   "name"
    t.string   "unit"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "rateclass_id"
  end

  add_index "ratetypes", ["rateclass_id"], name: "index_ratetypes_on_rateclass_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "lastname"
    t.text     "address"
    t.integer  "company_id"
    t.integer  "companygoer_id"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id"
  add_index "users", ["companygoer_id"], name: "index_users_on_companygoer_id"
  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
