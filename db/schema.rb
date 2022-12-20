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

ActiveRecord::Schema[7.0].define(version: 2022_12_19_223919) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale", default: "en", null: false
    t.index ["record_type", "record_id", "name", "locale"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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

  create_table "events", force: :cascade do |t|
    t.datetime "starting_at", precision: nil
    t.string "status", limit: 15
    t.boolean "is_featured", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug", limit: 30
    t.datetime "finishing_at"
    t.index ["slug"], name: "index_events_on_slug", unique: true
    t.index ["starting_at"], name: "index_events_on_starting_at"
  end

  create_table "pages", force: :cascade do |t|
    t.string "slug", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_pages_on_slug", unique: true
  end

  create_table "presenters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_presenters_on_name"
  end

  create_table "presenters_sessions", id: false, force: :cascade do |t|
    t.bigint "session_id", null: false
    t.bigint "presenter_id", null: false
    t.index ["presenter_id"], name: "index_presenters_sessions_on_presenter_id"
    t.index ["session_id"], name: "index_presenters_sessions_on_session_id"
  end

  create_table "session_types", force: :cascade do |t|
    t.integer "order_by", default: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "limit"
    t.bigint "event_id", null: false
    t.bigint "session_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "time_slot_id"
    t.index ["event_id"], name: "index_sessions_on_event_id"
    t.index ["session_type_id"], name: "index_sessions_on_session_type_id"
    t.index ["time_slot_id"], name: "index_sessions_on_time_slot_id"
  end

  create_table "time_slots", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.datetime "starting_at", null: false
    t.datetime "finishing_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id", "starting_at"], name: "index_time_slots_on_event_id_and_starting_at", unique: true
    t.index ["event_id"], name: "index_time_slots_on_event_id"
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
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.integer "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_zone", default: "London", null: false
    t.string "locale", default: "en", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "sessions", "events"
  add_foreign_key "sessions", "session_types"
  add_foreign_key "sessions", "time_slots"
  add_foreign_key "time_slots", "events"
end
