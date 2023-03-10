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

ActiveRecord::Schema[7.0].define(version: 2023_03_11_010648) do
  create_table "combo_items", force: :cascade do |t|
    t.integer "combo_price"
    t.integer "item_id", null: false
    t.integer "combo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["combo_id"], name: "index_combo_items_on_combo_id"
    t.index ["item_id"], name: "index_combo_items_on_item_id"
  end

  create_table "combos", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "combos_orders", id: false, force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "combo_id", null: false
    t.index ["combo_id", "order_id"], name: "index_combos_orders_on_combo_id_and_order_id"
    t.index ["order_id", "combo_id"], name: "index_combos_orders_on_order_id_and_combo_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "tax_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items_orders", id: false, force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "item_id", null: false
    t.index ["item_id", "order_id"], name: "index_items_orders_on_item_id_and_order_id"
    t.index ["order_id", "item_id"], name: "index_items_orders_on_order_id_and_item_id"
  end

  create_table "orders", force: :cascade do |t|
    t.boolean "submit"
    t.boolean "ready"
    t.boolean "complete"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "customer_id", null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  add_foreign_key "combo_items", "combos"
  add_foreign_key "combo_items", "items"
  add_foreign_key "orders", "customers"
end
