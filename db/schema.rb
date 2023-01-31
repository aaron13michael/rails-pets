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

ActiveRecord::Schema[7.0].define(version: 2023_01_31_180548) do
  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.text "details"
    t.string "image"
    t.datetime "modifieddt", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pet_type"
    t.boolean "child_friendly"
    t.integer "ease_of_care"
    t.integer "avg_weight"
    t.integer "min_age"
    t.integer "max_age"
    t.integer "cost"
    t.integer "intelligence"
  end

  create_table "weight_threshholds", force: :cascade do |t|
    t.string "pet_type"
    t.string "weight_class"
    t.integer "max_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
