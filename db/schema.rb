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

ActiveRecord::Schema.define(version: 2019_12_09_092023) do

  create_table "accounts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "acno"
    t.string "acname"
    t.string "bankname"
    t.string "ifsc"
    t.string "branch"
    t.string "userid"
  end

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "payslips", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "basic", default: 0
    t.integer "hra", default: 0
    t.integer "cca", default: 0
    t.integer "reim", default: 0
    t.integer "sa", default: 0
    t.integer "ta", default: 0
    t.integer "lop", default: 0
    t.integer "od", default: 0
    t.decimal "month"
    t.decimal "year"
    t.integer "pt", default: 0
    t.string "payslipid"
    t.integer "userid"
  end

  create_table "sals", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.decimal "basic", default: "0.0"
    t.decimal "hra", default: "0.0"
    t.decimal "cca", default: "0.0"
    t.decimal "sa", default: "0.0"
    t.decimal "ta", default: "0.0"
    t.decimal "reim", default: "0.0"
    t.decimal "it", default: "0.0"
    t.decimal "pt", default: "0.0"
    t.integer "lop", default: 0
    t.decimal "od", default: "0.0"
    t.string "userid"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "fname"
    t.string "lname"
    t.integer "age"
    t.date "date_of_joining"
    t.decimal "salary_per_annum"
    t.decimal "salary_per_month"
    t.string "phonenumber"
    t.text "address"
    t.string "blood_type"
    t.string "emergency_name"
    t.string "emergency_number"
    t.string "primary_skill"
    t.string "secondary_skill1"
    t.string "secondary_skill2"
    t.integer "notice"
    t.string "gender"
    t.string "state"
    t.string "pincode"
    t.string "city"
    t.string "role"
    t.string "country"
    t.string "empid", default: "0000"
    t.string "department"
    t.string "designation"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
