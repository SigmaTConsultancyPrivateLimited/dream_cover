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

ActiveRecord::Schema[7.0].define(version: 2022_09_07_172723) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "billings", force: :cascade do |t|
    t.date "date"
    t.string "card_type"
    t.string "card_number"
    t.string "card_exp_date"
    t.date "delivery_date"
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_billings_on_product_id"
  end

  create_table "cancellations", force: :cascade do |t|
    t.date "cancellation_date"
    t.bigint "purchase_record_id", null: false
    t.float "refund_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_record_id"], name: "index_cancellations_on_purchase_record_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "user_id", null: false
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_feedbacks_on_product_id"
    t.index ["user_id"], name: "index_feedbacks_on_user_id"
  end

  create_table "product_stocks", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.integer "total_stock"
    t.float "unit_price"
    t.float "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_stocks_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "product_name"
    t.string "product_code"
    t.bigint "category_id", null: false
    t.bigint "subcategory_id", null: false
    t.string "category_name"
    t.string "subcategory_name"
    t.string "product_image"
    t.integer "sku"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["subcategory_id"], name: "index_products_on_subcategory_id"
  end

  create_table "purchase_records", force: :cascade do |t|
    t.integer "quantity"
    t.float "price"
    t.bigint "billing_id", null: false
    t.float "discount"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["billing_id"], name: "index_purchase_records_on_billing_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "subcategory_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "user_addresses", force: :cascade do |t|
    t.string "complete_address"
    t.string "pincode"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_user_addresses_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email_id"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "billings", "products"
  add_foreign_key "cancellations", "purchase_records"
  add_foreign_key "feedbacks", "products"
  add_foreign_key "feedbacks", "users"
  add_foreign_key "product_stocks", "products"
  add_foreign_key "products", "categories"
  add_foreign_key "products", "subcategories"
  add_foreign_key "purchase_records", "billings"
  add_foreign_key "subcategories", "categories"
  add_foreign_key "user_addresses", "users"
end
