# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_05_30_114325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bot_users", force: :cascade do |t|
    t.string "first_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "created_at_desc"
    t.integer "messenger_user_id"
    t.string "test test"
    t.string "test_test"
    t.string "first name"
    t.string "last name"
    t.string "last_name"
    t.integer "messenger user id"
    t.string "gender"
    t.string "timezone"
    t.string "source"
    t.string "locale"
    t.integer "chatfuel user id"
    t.integer "chatfuel_user_id"
    t.string "last user freeform input"
    t.string "last_user_freeform_input"
    t.string "profile_pic_url"
    t.string "country"
    t.integer "user_id"
    t.integer "bot_id"
  end

  create_table "bots", force: :cascade do |t|
    t.string "name"
    t.string "first_name"
    t.string "first name"
    t.integer "user_id"
    t.string "image"
    t.datetime "created_at"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.text "description"
    t.string "slug"
  end

  create_table "pages", force: :cascade do |t|
    t.integer "bot_user_id"
  end

  create_table "pdfs", force: :cascade do |t|
    t.integer "amount_of_users"
    t.string "business_name"
    t.datetime "date"
    t.string "agency_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "material_id"
    t.bigint "seller_id"
    t.string "name"
    t.string "slug"
    t.decimal "price"
    t.string "product_image"
    t.decimal "gram", precision: 15, scale: 2
    t.decimal "purity", precision: 15, scale: 2
    t.decimal "diameter", precision: 15, scale: 2
    t.decimal "length", precision: 15, scale: 2
    t.integer "surface_area"
    t.string "solvent"
    t.string "layer"
    t.decimal "length_two", precision: 15, scale: 2
    t.decimal "mililiter", precision: 15, scale: 2
    t.datetime "created_at"
    t.string "pdf"
    t.integer "concentration"
    t.integer "thickness"
    t.integer "thickness_two"
    t.string "synthesis_method"
    t.integer "surface_area_two"
    t.index ["material_id"], name: "index_products_on_material_id"
    t.index ["seller_id"], name: "index_products_on_seller_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "website"
    t.string "email"
    t.string "logo"
    t.string "slug"
    t.text "description"
    t.datetime "created_at"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "products", "materials"
  add_foreign_key "products", "sellers"
end
