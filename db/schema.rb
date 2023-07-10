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

ActiveRecord::Schema.define(version: 2023_07_10_053232) do

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "building_id"
    t.bigint "floor_count"
    t.bigint "room_count"
    t.bigint "no_of_residents"
    t.bigint "society_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["society_id"], name: "index_buildings_on_society_id"
  end

  create_table "residents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "gender"
    t.bigint "age"
    t.bigint "phone_number"
    t.bigint "room_number"
    t.bigint "floor_number"
    t.bigint "society_id", null: false
    t.bigint "building_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_residents_on_building_id"
    t.index ["society_id"], name: "index_residents_on_society_id"
  end

  create_table "societies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "society_id"
    t.string "society_type"
    t.string "address"
    t.bigint "buildings_count"
    t.boolean "security_available"
    t.boolean "parking_available"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "visitors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "gender"
    t.bigint "age"
    t.bigint "phone_number"
    t.bigint "room_number"
    t.bigint "floor_number"
    t.bigint "society_id", null: false
    t.bigint "building_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["building_id"], name: "index_visitors_on_building_id"
    t.index ["society_id"], name: "index_visitors_on_society_id"
  end

  add_foreign_key "buildings", "societies"
  add_foreign_key "residents", "buildings"
  add_foreign_key "residents", "societies"
  add_foreign_key "visitors", "buildings"
  add_foreign_key "visitors", "societies"
end
