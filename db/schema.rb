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

ActiveRecord::Schema.define(version: 2019_08_21_150558) do

  create_table "account_details", force: :cascade do |t|
    t.string "accountable_type"
    t.integer "accountable_id"
    t.decimal "amount", precision: 15, scale: 10
    t.string "operateable_type"
    t.integer "operateable_id"
    t.string "mark"
    t.integer "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_account_details_on_account_id"
    t.index ["accountable_type", "accountable_id"], name: "index_account_details_on_accountable_type_and_accountable_id"
    t.index ["operateable_type", "operateable_id"], name: "index_account_details_on_operateable_type_and_operateable_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "coin", precision: 15, scale: 10
    t.decimal "frozen_coin", precision: 15, scale: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "bc_orders", force: :cascade do |t|
    t.integer "tenant_id"
    t.integer "user_id"
    t.string "bc_number"
    t.string "number"
    t.decimal "amount", precision: 15, scale: 10
    t.string "city"
    t.integer "status", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bc_number", "tenant_id"], name: "idx_uniq_bc_tenant", unique: true
    t.index ["city"], name: "idx_bc_city"
    t.index ["number"], name: "idx_bc_num", unique: true
    t.index ["status"], name: "index_bc_orders_on_status"
    t.index ["tenant_id"], name: "index_bc_orders_on_tenant_id"
    t.index ["user_id"], name: "index_bc_orders_on_user_id"
  end

  create_table "charge_orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "status", default: 1
    t.decimal "amount", precision: 15, scale: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_charge_orders_on_user_id"
  end

  create_table "rush_orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "bc_order_id"
    t.integer "status", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bc_order_id"], name: "index_rush_orders_on_bc_order_id"
    t.index ["user_id"], name: "index_rush_orders_on_user_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "name"
    t.string "api_key"
    t.text "pub_key"
    t.text "public_rsa_key"
    t.text "private_rsa_key"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["api_key"], name: "idx_tenant_key", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "token"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["phone"], name: "idx_user_phone", unique: true
    t.index ["token"], name: "idx_user_token", unique: true
  end

end
