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

ActiveRecord::Schema.define(version: 20171215033934) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_first_name"
    t.string "user_last_name"
    t.date "user_birth_date"
    t.string "user_phone_number"
    t.string "remote_image"
    t.index ["user_id"], name: "index_accounts_on_user_id", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drivers_licenses", force: :cascade do |t|
    t.string "number"
    t.date "expiration_date"
    t.date "issue_date"
    t.bigint "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_drivers_licenses_on_account_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features_vehicles", id: false, force: :cascade do |t|
    t.bigint "vehicle_id"
    t.bigint "feature_id"
    t.index ["feature_id"], name: "index_features_vehicles_on_feature_id"
    t.index ["vehicle_id"], name: "index_features_vehicles_on_vehicle_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer "imageable_id"
    t.string "imageable_type"
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "street_address", limit: 255
    t.string "city", limit: 255
    t.string "state", limit: 255
    t.string "zip_code"
    t.string "country", limit: 255
  end

  create_table "reservation_invoices", force: :cascade do |t|
    t.bigint "reservation_id"
    t.decimal "service_tax"
    t.decimal "vat"
    t.decimal "total_amount"
    t.decimal "discount_amount"
    t.decimal "net_amount"
    t.index ["reservation_id"], name: "index_reservation_invoices_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "total_price"
    t.bigint "renter_account_id"
    t.bigint "lender_account_id"
    t.bigint "vehicle_id"
    t.integer "location_id"
    t.string "status"
    t.boolean "is_confirmed", default: false
    t.index ["lender_account_id"], name: "index_reservations_on_lender_account_id"
    t.index ["location_id"], name: "index_reservations_on_location_id"
    t.index ["renter_account_id"], name: "index_reservations_on_renter_account_id"
    t.index ["vehicle_id"], name: "index_reservations_on_vehicle_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.integer "reviewer_account_id"
    t.bigint "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reviewer_account_id"], name: "index_reviews_on_reviewer_account_id"
    t.index ["vehicle_id"], name: "index_reviews_on_vehicle_id"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "account_id"
    t.string "provider"
    t.string "uid"
    t.boolean "is_admin?"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "make"
    t.string "model"
    t.integer "year"
    t.integer "milage"
    t.string "transmission"
    t.string "color"
    t.integer "seats"
    t.integer "doors"
    t.decimal "daily_price"
    t.bigint "current_location_id"
    t.bigint "category_id"
    t.bigint "owner_account_id"
    t.date "availability_start"
    t.date "availability_end"
    t.index ["category_id"], name: "index_vehicles_on_category_id"
    t.index ["current_location_id"], name: "index_vehicles_on_current_location_id"
    t.index ["owner_account_id"], name: "index_vehicles_on_owner_account_id"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "drivers_licenses", "accounts"
  add_foreign_key "features_vehicles", "features"
  add_foreign_key "features_vehicles", "vehicles"
  add_foreign_key "reservation_invoices", "reservations"
  add_foreign_key "reservations", "accounts", column: "lender_account_id"
  add_foreign_key "reservations", "accounts", column: "renter_account_id"
  add_foreign_key "reservations", "locations"
  add_foreign_key "reservations", "vehicles"
  add_foreign_key "reviews", "accounts", column: "reviewer_account_id"
  add_foreign_key "reviews", "vehicles"
  add_foreign_key "vehicles", "categories"
  add_foreign_key "vehicles", "locations", column: "current_location_id"
  add_foreign_key "vehicles", "locations", column: "owner_account_id"
end
