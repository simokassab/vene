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

ActiveRecord::Schema[8.0].define(version: 2025_12_01_212853) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "banners", force: :cascade do |t|
    t.string "image", null: false
    t.string "title_en"
    t.string "title_ar"
    t.string "subtitle_en"
    t.string "subtitle_ar"
    t.boolean "active", default: true, null: false
    t.integer "position", default: 0
    t.bigint "product_id"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_banners_on_active"
    t.index ["position"], name: "index_banners_on_position"
    t.index ["product_id"], name: "index_banners_on_product_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name_en", null: false
    t.string "name_ar", null: false
    t.string "slug", null: false
    t.boolean "active", default: true, null: false
    t.integer "position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.index ["slug"], name: "index_categories_on_slug", unique: true
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.integer "quantity", default: 1, null: false
    t.decimal "unit_price", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "line_total", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_variant_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
    t.index ["product_variant_id"], name: "index_order_items_on_product_variant_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "country", null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "shipping_method", default: "DHL", null: false
    t.decimal "subtotal", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "tax_amount", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "shipping_amount", precision: 10, scale: 2, default: "0.0", null: false
    t.decimal "total_amount", precision: 10, scale: 2, default: "0.0", null: false
    t.string "tax_type", default: "local", null: false
    t.string "status", default: "payment_pending", null: false
    t.string "dhl_tracking_id"
    t.string "payment_status", default: "pending", null: false
    t.string "montypay_transaction_id"
    t.string "payment_reference"
    t.datetime "paid_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dhl_tracking_id"], name: "index_orders_on_dhl_tracking_id"
    t.index ["payment_status"], name: "index_orders_on_payment_status"
    t.index ["status"], name: "index_orders_on_status"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title_en", null: false
    t.string "title_ar", null: false
    t.string "slug", null: false
    t.text "content_en"
    t.text "content_ar"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_pages_on_slug", unique: true
  end

  create_table "product_images", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "image", null: false
    t.integer "position", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_images_on_product_id"
  end

  create_table "product_relations", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "related_product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id", "related_product_id"], name: "index_product_relations_on_product_id_and_related_product_id", unique: true
    t.index ["product_id"], name: "index_product_relations_on_product_id"
    t.index ["related_product_id"], name: "index_product_relations_on_related_product_id"
  end

  create_table "product_variants", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "name"
    t.string "value"
    t.integer "stock_quantity", default: 0, null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "variant_type_id"
    t.bigint "variant_option_id"
    t.index ["product_id", "name", "value"], name: "index_variants_on_product_name_value", unique: true
    t.index ["product_id"], name: "index_product_variants_on_product_id"
    t.index ["variant_option_id"], name: "index_product_variants_on_variant_option_id"
    t.index ["variant_type_id"], name: "index_product_variants_on_variant_type_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name_en", null: false
    t.string "name_ar", null: false
    t.text "description_en"
    t.text "description_ar"
    t.decimal "price", precision: 10, scale: 2, default: "0.0", null: false
    t.bigint "category_id", null: false
    t.integer "stock_quantity", default: 0, null: false
    t.string "metal"
    t.string "diamonds"
    t.string "gemstones"
    t.boolean "active", default: true, null: false
    t.string "slug", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "featured", default: false
    t.boolean "on_sale", default: false
    t.decimal "sale_price", precision: 10, scale: 2
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["slug"], name: "index_products_on_slug", unique: true
  end

  create_table "settings", force: :cascade do |t|
    t.string "store_name", default: "VENE Jewelry", null: false
    t.decimal "local_tax_rate", precision: 5, scale: 2, default: "0.0", null: false
    t.decimal "international_tax_rate", precision: 5, scale: 2, default: "0.0", null: false
    t.decimal "shipping_flat_rate", precision: 10, scale: 2, default: "0.0", null: false
    t.string "default_currency", default: "USD", null: false
    t.string "whatsapp_phone_number"
    t.string "local_country", default: "Lebanon", null: false
    t.string "montypay_merchant_id"
    t.string "montypay_api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", default: "", null: false
    t.string "phone", default: "", null: false
    t.string "role", default: "customer", null: false
    t.string "default_country"
    t.string "default_city"
    t.string "default_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variant_options", force: :cascade do |t|
    t.bigint "variant_type_id", null: false
    t.string "value", null: false
    t.integer "position", default: 0, null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["variant_type_id", "value"], name: "index_variant_options_on_variant_type_id_and_value", unique: true
    t.index ["variant_type_id"], name: "index_variant_options_on_variant_type_id"
  end

  create_table "variant_types", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_variant_types_on_name", unique: true
  end

  add_foreign_key "banners", "products", on_delete: :nullify
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "product_variants"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "product_images", "products"
  add_foreign_key "product_relations", "products"
  add_foreign_key "product_relations", "products", column: "related_product_id"
  add_foreign_key "product_variants", "products"
  add_foreign_key "product_variants", "variant_options"
  add_foreign_key "product_variants", "variant_types"
  add_foreign_key "products", "categories"
  add_foreign_key "variant_options", "variant_types"
end
