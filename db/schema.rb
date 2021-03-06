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

ActiveRecord::Schema.define(version: 2018_05_01_090845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "item_users", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "item_id"
    t.bigint "pricing_id"
    t.date "start"
    t.date "stop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_users_on_item_id"
    t.index ["pricing_id"], name: "index_item_users_on_pricing_id"
    t.index ["profile_id"], name: "index_item_users_on_profile_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "reservation_id"
    t.bigint "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_items_on_reservation_id"
    t.index ["room_id"], name: "index_items_on_room_id"
  end

  create_table "modifiers", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.integer "percent"
    t.date "start"
    t.date "stop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pricings", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.integer "price_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "modifier_id"
    t.date "start"
    t.date "stop"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.index ["modifier_id"], name: "index_reservations_on_modifier_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photos", array: true
    t.string "expositions", array: true
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "capacity"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "item_users", "items"
  add_foreign_key "item_users", "pricings"
  add_foreign_key "item_users", "profiles"
  add_foreign_key "items", "reservations"
  add_foreign_key "items", "rooms"
  add_foreign_key "profiles", "users"
  add_foreign_key "reservations", "modifiers"
  add_foreign_key "reservations", "users"
end
