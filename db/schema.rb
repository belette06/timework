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

ActiveRecord::Schema[7.0].define(version: 2022_08_30_111400) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adresses", force: :cascade do |t|
    t.bigint "affaires_id"
    t.string "number"
    t.string "street", null: false
    t.string "street2"
    t.string "zip", null: false
    t.string "city", null: false
    t.string "contry", null: false
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["affaires_id"], name: "index_adresses_on_affaires_id"
  end

  create_table "affaires", force: :cascade do |t|
    t.string "number"
    t.string "client"
    t.string "title"
    t.integer "workaffaire", default: 0
    t.bigint "worktime_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "adresse_id", null: false
    t.index ["adresse_id"], name: "index_affaires_on_adresse_id"
    t.index ["id"], name: "index_affaires_on_id", unique: true
    t.index ["worktime_id"], name: "index_affaires_on_worktime_id"
  end

  create_table "profils", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "phone"
    t.string "phone_supl"
    t.string "job"
    t.bigint "adresse_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adresse_id"], name: "index_profils_on_adresse_id"
    t.index ["user_id"], name: "index_profils_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: ""
    t.string "lastname", default: ""
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "weektime_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["weektime_id"], name: "index_users_on_weektime_id"
  end

  create_table "weektimes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "dateweek"
    t.integer "numsemaine"
    t.float "workweek", default: 0.0
    t.boolean "accord", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "worktimes_id"
    t.index ["id"], name: "index_weektimes_on_id", unique: true
    t.index ["user_id"], name: "index_weektimes_on_user_id"
    t.index ["worktimes_id"], name: "index_weektimes_on_worktimes_id"
  end

  create_table "worktimes", force: :cascade do |t|
    t.bigint "weektime_id", null: false
    t.time "gotime"
    t.time "endtime"
    t.integer "daytime"
    t.integer "workday", default: 0
    t.boolean "accord", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "affaire_id"
    t.index ["affaire_id"], name: "index_worktimes_on_affaire_id"
    t.index ["id"], name: "index_worktimes_on_id", unique: true
    t.index ["weektime_id"], name: "index_worktimes_on_weektime_id"
  end

  add_foreign_key "adresses", "affaires", column: "affaires_id"
  add_foreign_key "affaires", "adresses", column: "adresse_id"
  add_foreign_key "affaires", "worktimes"
  add_foreign_key "profils", "adresses", column: "adresse_id"
  add_foreign_key "profils", "users"
  add_foreign_key "users", "weektimes"
  add_foreign_key "weektimes", "users"
  add_foreign_key "weektimes", "worktimes", column: "worktimes_id"
  add_foreign_key "worktimes", "affaires"
  add_foreign_key "worktimes", "weektimes"
end
