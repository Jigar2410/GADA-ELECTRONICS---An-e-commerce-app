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

ActiveRecord::Schema[7.0].define(version: 2023_03_23_135421) do
  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["name"], name: "index_items_on_name", unique: true
  end

  create_table "order_items", force: :cascade do |t|
    t.string "cart_id"
    t.integer "item_id"
    t.integer "item_quantity"
    t.integer "item_total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "item_name"
  end

  create_table "orders", id: :string, force: :cascade do |t|
    t.integer "user_id"
    t.integer "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "order_items", "orders", column: "cart_id"
  add_foreign_key "orders", "users"
end
