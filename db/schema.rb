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

ActiveRecord::Schema.define(version: 2019_08_16_152605) do

  create_table "accounts", force: :cascade do |t|
    t.integer "user_id"
    t.decimal "coin", precision: 15, scale: 10
    t.decimal "frozen_coin", precision: 15, scale: 10
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
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
