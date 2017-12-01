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

ActiveRecord::Schema.define(version: 20171201074636) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.bigint "vehicle_id"
    t.index ["vehicle_id"], name: "index_images_on_vehicle_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "street_address", limit: 255
    t.string "city", limit: 255
    t.string "state", limit: 255
    t.integer "zip_code"
    t.string "country", limit: 255
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.bigint "total_price"
    t.bigint "renter_account_id"
    t.bigint "lender_account_id"
    t.bigint "vehicle_id"
    t.index ["lender_account_id"], name: "index_reservations_on_lender_account_id"
    t.index ["renter_account_id"], name: "index_reservations_on_renter_account_id"
    t.index ["vehicle_id"], name: "index_reservations_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.integer "age"
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
    t.integer "daily_price"
    t.bigint "current_location_id"
    t.bigint "vehicle_category_id"
    t.bigint "owner_account_id"
    t.index ["current_location_id"], name: "index_vehicles_on_current_location_id"
    t.index ["owner_account_id"], name: "index_vehicles_on_owner_account_id"
    t.index ["vehicle_category_id"], name: "index_vehicles_on_vehicle_category_id"
  end

  add_foreign_key "accounts", "users"
end
