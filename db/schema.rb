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

ActiveRecord::Schema[7.0].define(version: 2022_09_01_005521) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "adresses", force: :cascade do |t|
    t.string "number"
    t.string "street"
    t.string "street2"
    t.string "zip"
    t.string "city"
    t.string "contry"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "affaires", force: :cascade do |t|
    t.bigint "adresse_id"
    t.string "number"
    t.string "client"
    t.string "title"
    t.integer "workaffaire", default: 0
    t.bigint "worktime_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adresse_id"], name: "index_affaires_on_adresse_id"
    t.index ["id"], name: "index_affaires_on_id", unique: true
    t.index ["worktime_id"], name: "index_affaires_on_worktime_id"
  end

  create_table "depannages", force: :cascade do |t|
    t.string "client"
    t.string "title"
    t.string "number"
    t.string "body"
    t.boolean "closed"
    t.bigint "worktimes_id", null: false
    t.bigint "adresse_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adresse_id"], name: "index_depannages_on_adresse_id"
    t.index ["worktimes_id"], name: "index_depannages_on_worktimes_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "firstname"
    t.string "lastname"
    t.string "phone"
    t.string "phone_supl"
    t.string "job"
    t.bigint "adresse_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adresse_id"], name: "index_profiles_on_adresse_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "weektime_id"
    t.bigint "profile_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["profile_id"], name: "index_users_on_profile_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "affaires", "adresses", column: "adresse_id"
  add_foreign_key "affaires", "worktimes"
  add_foreign_key "depannages", "adresses", column: "adresse_id"
  add_foreign_key "depannages", "worktimes", column: "worktimes_id"
  add_foreign_key "profiles", "adresses", column: "adresse_id"
  add_foreign_key "profiles", "users"
  add_foreign_key "users", "profiles"
  add_foreign_key "users", "weektimes"
  add_foreign_key "weektimes", "users"
  add_foreign_key "weektimes", "worktimes", column: "worktimes_id"
  add_foreign_key "worktimes", "affaires"
  add_foreign_key "worktimes", "weektimes"
end
