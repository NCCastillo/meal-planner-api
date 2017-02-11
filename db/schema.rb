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

ActiveRecord::Schema.define(version: 20170211184242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meal_ingredients", force: :cascade do |t|
    t.integer  "meal_id"
    t.integer  "ingredient_id"
    t.string   "amount"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["ingredient_id"], name: "index_meal_ingredients_on_ingredient_id", using: :btree
    t.index ["meal_id"], name: "index_meal_ingredients_on_meal_id", using: :btree
  end

  create_table "meals", force: :cascade do |t|
    t.text     "direction"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menu_items", force: :cascade do |t|
    t.string   "menu_option"
    t.integer  "meal_id"
    t.integer  "menu_id"
    t.string   "day"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["meal_id"], name: "index_menu_items_on_meal_id", using: :btree
    t.index ["menu_id"], name: "index_menu_items_on_menu_id", using: :btree
  end

  create_table "menus", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "week_of"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_menus_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
  end

  add_foreign_key "meal_ingredients", "ingredients"
  add_foreign_key "meal_ingredients", "meals"
  add_foreign_key "menu_items", "meals"
  add_foreign_key "menu_items", "menus"
  add_foreign_key "menus", "users"
end
