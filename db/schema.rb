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

ActiveRecord::Schema[7.0].define(version: 2023_08_19_163131) do
  create_table "chairs", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "country"
    t.string "city"
    t.string "picture", default: "placeholder_chair.jpeg"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company"
    t.date "available_from"
    t.text "description"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "chair_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chair_id"], name: "index_favorites_on_chair_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "feature_assignments", force: :cascade do |t|
    t.integer "chair_id", null: false
    t.integer "feature_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chair_id"], name: "index_feature_assignments_on_chair_id"
    t.index ["feature_id"], name: "index_feature_assignments_on_feature_id"
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "stars"
    t.text "comment"
    t.integer "chair_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["chair_id"], name: "index_reviews_on_chair_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "avatar", default: "dhh.jpeg"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  add_foreign_key "favorites", "chairs"
  add_foreign_key "favorites", "users"
  add_foreign_key "feature_assignments", "chairs"
  add_foreign_key "feature_assignments", "features"
  add_foreign_key "reviews", "chairs"
end
