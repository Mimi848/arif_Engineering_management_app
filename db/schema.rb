# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_07_005106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "labours", force: :cascade do |t|
    t.date "weekend_date"
    t.integer "weekly_expense"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_labours_on_project_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.date "purchase_date"
    t.float "per_unit_price"
    t.integer "quantity"
    t.integer "total_cost"
    t.string "category"
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_materials_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.date "started_on"
    t.date "completed_on"
    t.boolean "finished"
    t.string "owner_name"
    t.string "size"
    t.integer "total_expense"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "labours", "projects"
  add_foreign_key "materials", "projects"
end
