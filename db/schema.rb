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

ActiveRecord::Schema.define(version: 2020_11_26_201934) do

  create_table "advocates", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "job_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer "firm_id"
    t.integer "user_id"
    t.string "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "communications", force: :cascade do |t|
    t.integer "contact_id"
    t.integer "job_id"
    t.date "date"
    t.string "comm_type"
    t.boolean "outgoing"
    t.boolean "incoming"
    t.string "notes"
    t.date "followup_date"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "employee_id"
    t.string "notes"
    t.string "relationship"
    t.string "outgoing_comms"
    t.string "incoming_comms"
    t.date "last_outgoing_comm"
    t.date "last_incoming_comm"
    t.date "followup_date"
    t.integer "communications_count"
    t.integer "advocates_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer "firm_id"
    t.string "role"
    t.string "first_name"
    t.string "last_name"
    t.string "notes"
    t.boolean "alumni"
    t.string "linkedin"
    t.string "email"
    t.integer "connections_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "firms", force: :cascade do |t|
    t.string "industry"
    t.string "location"
    t.string "name"
    t.string "notes"
    t.integer "jobs_count"
    t.integer "bookmarks_count"
    t.integer "employees_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.integer "firm_id"
    t.string "role"
    t.string "location"
    t.string "notes"
    t.date "application_deadline"
    t.boolean "applied"
    t.date "application_date"
    t.string "application_status"
    t.string "application_mode"
    t.string "application_outcome"
    t.string "application_next_steps"
    t.integer "user_id"
    t.integer "communications_count"
    t.integer "advocates_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.integer "bookmarks_count"
    t.integer "contacts_count"
    t.integer "communications_count"
    t.integer "jobs_count"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
