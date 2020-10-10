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

ActiveRecord::Schema.define(version: 2020_10_08_204023) do

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "neighborhood"
    t.string "zipcode"
    t.string "number"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "cpf_cnpj"
    t.string "name"
    t.string "email"
    t.integer "address_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_clients_on_address_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name"
    t.string "cpf"
    t.string "cnh"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "phones", force: :cascade do |t|
    t.string "phone_number"
    t.integer "client_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_phones_on_client_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "status"
    t.decimal "price"
    t.datetime "data"
    t.integer "address_id", null: false
    t.integer "driver_id", null: false
    t.integer "client_id", null: false
    t.integer "vehicle_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_services_on_address_id"
    t.index ["client_id"], name: "index_services_on_client_id"
    t.index ["driver_id"], name: "index_services_on_driver_id"
    t.index ["vehicle_id"], name: "index_services_on_vehicle_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "category"
    t.string "board"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "clients", "addresses"
  add_foreign_key "phones", "clients"
  add_foreign_key "services", "addresses"
  add_foreign_key "services", "clients"
  add_foreign_key "services", "drivers"
  add_foreign_key "services", "vehicles"
ActiveRecord::Schema.define(version: 2020_10_10_202159) do

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "cpf"
    t.string "kind"
    t.index ["cpf"], name: "index_users_on_cpf", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
