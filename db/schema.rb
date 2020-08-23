# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_23_091601) do

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "postal_code"
    t.string "prefecture"
    t.string "address1"
    t.string "address2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "entries", force: :cascade do |t|
    t.integer "user_id"
    t.integer "requirement_id"
    t.text "reason"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["requirement_id"], name: "index_entries_on_requirement_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "requirement_id"
    t.integer "degree", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["requirement_id"], name: "index_interests_on_requirement_id"
    t.index ["user_id"], name: "index_interests_on_user_id"
  end

  create_table "requirements", force: :cascade do |t|
    t.string "title", null: false
    t.text "initiative"
    t.text "request_content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "company_id"
    t.boolean "need_reason", default: false
    t.index ["company_id"], name: "index_requirements_on_company_id"
  end

  create_table "scouts", force: :cascade do |t|
    t.integer "company_id"
    t.integer "user_id"
    t.integer "degree"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_scouts_on_company_id"
    t.index ["user_id"], name: "index_scouts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.text "about"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "company_id"
    t.string "password_digest"
    t.string "postal_code"
    t.string "prefecture"
    t.string "address1"
    t.string "address2"
    t.index ["company_id"], name: "index_users_on_company_id"
  end

  add_foreign_key "interests", "requirements"
  add_foreign_key "interests", "requirements"
  add_foreign_key "interests", "users"
  add_foreign_key "interests", "users"
  add_foreign_key "requirements", "companies"
  add_foreign_key "scouts", "companies"
  add_foreign_key "scouts", "users"
  add_foreign_key "users", "companies"
end
