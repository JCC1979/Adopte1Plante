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

ActiveRecord::Schema.define(version: 2019_03_10_144511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compositions", force: :cascade do |t|
    t.text "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.string "local_image"
    t.string "variant_pot_sku"
    t.string "variant_plant_sku"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "composition_id"
    t.string "status", default: "waiting for payment"
    t.string "composition_nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["composition_id"], name: "index_orders_on_composition_id"
    t.index ["profile_id"], name: "index_orders_on_profile_id"
  end

  create_table "plants", force: :cascade do |t|
    t.integer "id_code"
    t.integer "id_sup"
    t.string "family"
    t.string "gender"
    t.string "species"
    t.string "cultivar"
    t.string "variant"
    t.text "description"
    t.string "sun_exposure"
    t.string "watering"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "synonym_id"
    t.string "commercial_name"
    t.text "synonyms_list"
    t.index ["synonym_id"], name: "index_plants_on_synonym_id"
  end

  create_table "pots", force: :cascade do |t|
    t.string "name"
    t.string "material"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.bigint "category_id"
    t.jsonb "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "address"
    t.integer "address_zipcode"
    t.string "address_city"
    t.string "address_country"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "composition_id"
    t.integer "rate"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["composition_id"], name: "index_ratings_on_composition_id"
  end

  create_table "synonyms", force: :cascade do |t|
    t.string "commercial_name"
    t.text "synonyms_list"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxrefs", force: :cascade do |t|
    t.string "id_code"
    t.string "id_sup"
    t.string "rang_code"
    t.string "full_name"
    t.string "family"
    t.string "gender"
    t.string "species"
    t.string "cultivar"
    t.string "variant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variant_plants", force: :cascade do |t|
    t.string "sku"
    t.bigint "plant_id"
    t.integer "diameter_cm"
    t.string "height_format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plant_id"], name: "index_variant_plants_on_plant_id"
  end

  create_table "variant_pots", force: :cascade do |t|
    t.string "sku"
    t.bigint "pot_id"
    t.integer "diameter_cm"
    t.string "height_format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pot_id"], name: "index_variant_pots_on_pot_id"
  end

  create_table "variants", force: :cascade do |t|
    t.string "sku"
    t.bigint "product_id"
    t.integer "diameter_cm"
    t.string "height_format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pot_id"
    t.bigint "plant_id"
    t.index ["plant_id"], name: "index_variants_on_plant_id"
    t.index ["pot_id"], name: "index_variants_on_pot_id"
    t.index ["product_id"], name: "index_variants_on_product_id"
  end

  add_foreign_key "orders", "compositions"
  add_foreign_key "orders", "profiles"
  add_foreign_key "products", "categories"
  add_foreign_key "profiles", "users"
  add_foreign_key "ratings", "compositions"
  add_foreign_key "variant_plants", "plants"
  add_foreign_key "variant_pots", "pots"
  add_foreign_key "variants", "products"
end
