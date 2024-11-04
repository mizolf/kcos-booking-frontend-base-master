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

ActiveRecord::Schema.define(version: 20210401081252) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "pass_changed"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "superadmin", default: false
    t.string "image"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "app_settings", force: :cascade do |t|
    t.string "space_booking_consent"
    t.string "space_rent_consent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "file"
    t.string "name"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faqs", force: :cascade do |t|
    t.string "question"
    t.string "answer"
    t.integer "position"
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
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "gallery_images", force: :cascade do |t|
    t.string "landing_page_id"
    t.string "image"
    t.string "image_alt"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landing_pages", force: :cascade do |t|
    t.string "about_project"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legal_pages", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.string "title"
    t.string "content"
    t.integer "position"
    t.boolean "list", default: true
    t.string "seo_description"
    t.string "seo_keywords"
    t.string "seo_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "page_meta_tags", force: :cascade do |t|
    t.string "title"
    t.string "og_title"
    t.string "description"
    t.string "keywords"
    t.string "image"
    t.string "page"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.string "text"
    t.date "publish_at"
    t.string "image"
    t.string "image_alt"
    t.string "slug"
    t.string "seo_image"
    t.string "seo_title"
    t.string "seo_description"
    t.string "seo_keywords"
    t.boolean "preview", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_permissions", force: :cascade do |t|
    t.integer "admin_id"
    t.string "resource"
    t.boolean "permitted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "space_booking_terms", force: :cascade do |t|
    t.integer "space_booking_id"
    t.date "date"
    t.integer "time_from"
    t.integer "time_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
    t.string "last_status_seen", default: "pending"
    t.index ["space_booking_id"], name: "index_space_booking_terms_on_space_booking_id"
  end

  create_table "space_bookings", force: :cascade do |t|
    t.integer "space_id"
    t.string "first_name"
    t.string "last_name"
    t.string "organisation"
    t.string "phone"
    t.string "email"
    t.string "people_count"
    t.string "purpose"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token"
    t.datetime "seen_at"
    t.string "other"
    t.boolean "finished", default: false
    t.datetime "last_status_seen_updated_at"
    t.index ["space_id"], name: "index_space_bookings_on_space_id"
  end

  create_table "space_images", force: :cascade do |t|
    t.integer "space_id"
    t.string "image"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_space_images_on_space_id"
  end

  create_table "space_rent_requests", force: :cascade do |t|
    t.integer "space_id"
    t.string "first_name"
    t.string "last_name"
    t.string "organisation"
    t.string "phone"
    t.string "email"
    t.string "people_count"
    t.string "work_plan"
    t.string "work_goal"
    t.string "partners"
    t.string "other"
    t.string "token"
    t.datetime "seen_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_space_rent_requests_on_space_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "name"
    t.integer "book_price_cents", default: 0, null: false
    t.string "book_price_currency", default: "HRK", null: false
    t.integer "rent_price_cents", default: 0, null: false
    t.string "rent_price_currency", default: "HRK", null: false
    t.string "surface_area"
    t.string "description"
    t.boolean "bookable", default: true
    t.boolean "rentable", default: true
    t.boolean "available", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "bookable_from", default: 0
    t.integer "bookable_to", default: 1440
  end

  create_table "tinymce_pictures", force: :cascade do |t|
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
