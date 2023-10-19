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

ActiveRecord::Schema[7.0].define(version: 2023_10_19_122120) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assetz", force: :cascade do |t|
    t.string "asset_name"
    t.string "asset_category"
    t.text "asset_image"
    t.string "asset_condition"
    t.decimal "purchase_value"
    t.decimal "current_value"
    t.integer "quantity"
    t.bigint "department_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_assetz_on_department_id"
    t.index ["employee_id"], name: "index_assetz_on_employee_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "department_name"
    t.string "department_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "devise_api_tokens", force: :cascade do |t|
    t.string "resource_owner_type", null: false
    t.bigint "resource_owner_id", null: false
    t.string "access_token", null: false
    t.string "refresh_token"
    t.integer "expires_in", null: false
    t.datetime "revoked_at"
    t.string "previous_refresh_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["access_token"], name: "index_devise_api_tokens_on_access_token"
    t.index ["previous_refresh_token"], name: "index_devise_api_tokens_on_previous_refresh_token"
    t.index ["refresh_token"], name: "index_devise_api_tokens_on_refresh_token"
    t.index ["resource_owner_type", "resource_owner_id"], name: "index_devise_api_tokens_on_resource_owner"
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.bigint "phone_number"
    t.text "employee_role"
    t.date "employment_date"
    t.text "employee_image"
    t.bigint "department_id", null: false
    t.string "jti", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["jti"], name: "index_employees_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "repairs", force: :cascade do |t|
    t.integer "quantity"
    t.date "checkin_date"
    t.date "checkout_date"
    t.text "repair_comments"
    t.bigint "asset_id", null: false
    t.bigint "request_id", null: false
    t.bigint "department_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_repairs_on_asset_id"
    t.index ["department_id"], name: "index_repairs_on_department_id"
    t.index ["employee_id"], name: "index_repairs_on_employee_id"
    t.index ["request_id"], name: "index_repairs_on_request_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "request_type"
    t.string "new_asset_name"
    t.text "urgency"
    t.integer "quantity"
    t.text "reason"
    t.date "request_date"
    t.text "request_status"
    t.date "approval_date"
    t.text "procurement_comments"
    t.bigint "asset_id", null: false
    t.bigint "department_id", null: false
    t.bigint "employee_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_requests_on_asset_id"
    t.index ["department_id"], name: "index_requests_on_department_id"
    t.index ["employee_id"], name: "index_requests_on_employee_id"
  end

  add_foreign_key "assetz", "departments"
  add_foreign_key "assetz", "employees"
  add_foreign_key "employees", "departments"
  add_foreign_key "repairs", "assetz", column: "asset_id"
  add_foreign_key "repairs", "departments"
  add_foreign_key "repairs", "employees"
  add_foreign_key "repairs", "requests"
  add_foreign_key "requests", "assetz", column: "asset_id"
  add_foreign_key "requests", "departments"
  add_foreign_key "requests", "employees"
end
