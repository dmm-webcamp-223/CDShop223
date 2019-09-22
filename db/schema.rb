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

ActiveRecord::Schema.define(version: 2019_09_21_105648) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name_kanzi_sei"
    t.string "name_kanzi_mei"
    t.string "name_kana_sei"
    t.string "name_kana_mei"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.string "artist"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "package_id"
    t.integer "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity", default: 0
    t.integer "total_cost", default: 0
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discs", force: :cascade do |t|
    t.integer "package_id"
    t.integer "disc_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "how_to_pays", force: :cascade do |t|
    t.string "how_to_pay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_logs", force: :cascade do |t|
    t.integer "package_id"
    t.integer "order_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.integer "artist_id"
    t.integer "label_id"
    t.integer "genre_id"
    t.string "title"
    t.text "disc_image_id"
    t.integer "price"
    t.integer "disc_stock", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.boolean "disc_status", default: false, null: false
    t.index ["deleted_at"], name: "index_packages_on_deleted_at"
  end

  create_table "purchase_data_logs", force: :cascade do |t|
    t.integer "recept_log_id"
    t.integer "purchase_price"
    t.integer "tax"
    t.integer "numbers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "package_id"
  end

  create_table "recept_logs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "postal_code"
    t.string "delivering_adddress"
    t.integer "postage"
    t.boolean "delivered_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total", default: 0
  end

  create_table "ship_adresses", force: :cascade do |t|
    t.integer "user_id"
    t.string "shipping_add"
    t.integer "postal_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ship_data_logs", force: :cascade do |t|
    t.integer "package_id"
    t.string "ship_date"
    t.integer "shiped_number"
    t.string "supplier"
    t.boolean "arrival_status", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ship_number"
  end

  create_table "songs", force: :cascade do |t|
    t.integer "disc_id"
    t.string "song"
    t.integer "song_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name_kanzi_sei"
    t.string "name_kanzi_mei"
    t.string "name_kana_sei"
    t.string "name_kana_mei"
    t.integer "postal_code"
    t.string "address"
    t.integer "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.boolean "user_status"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
