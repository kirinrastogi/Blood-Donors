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

ActiveRecord::Schema.define(version: 20170308235134) do

  create_table "donations", force: :cascade do |t|
    t.integer  "donor_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["donor_id"], name: "index_donations_on_donor_id"
    t.index ["recipient_id"], name: "index_donations_on_recipient_id"
  end

  create_table "donors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "blood_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nurses", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "present_nurses", force: :cascade do |t|
    t.integer  "transaction_id"
    t.integer  "nurse_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["nurse_id"], name: "index_present_nurses_on_nurse_id"
    t.index ["transaction_id"], name: "index_present_nurses_on_transaction_id"
  end

  create_table "recipients", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "blood_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
