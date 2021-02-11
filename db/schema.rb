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

ActiveRecord::Schema.define(version: 2021_02_11_040443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delivery_dates", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "order_statuses", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.float "amount"
    t.bigint "user_id", null: false
    t.bigint "payment_status_id", null: false
    t.bigint "order_status_id", null: false
    t.bigint "delivery_date_id", null: false
    t.bigint "payment_date_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["delivery_date_id"], name: "index_orders_on_delivery_date_id"
    t.index ["order_status_id"], name: "index_orders_on_order_status_id"
    t.index ["payment_date_id"], name: "index_orders_on_payment_date_id"
    t.index ["payment_status_id"], name: "index_orders_on_payment_status_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payment_dates", force: :cascade do |t|
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payment_statuses", force: :cascade do |t|
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "orders", "delivery_dates"
  add_foreign_key "orders", "order_statuses"
  add_foreign_key "orders", "payment_dates"
  add_foreign_key "orders", "payment_statuses"
  add_foreign_key "orders", "users"
end
