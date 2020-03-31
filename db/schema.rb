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

ActiveRecord::Schema.define(version: 2020_03_31_200054) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "email_notification_subscriptions", force: :cascade do |t|
    t.string "email"
    t.string "address_lon"
    t.string "address_lat"
    t.geography "address_lonlat", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_lonlat"], name: "index_email_notification_subscriptions_on_address_lonlat", using: :gist
  end

  create_table "help_requests", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.geography "address_lonlat", limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.string "address_lon"
    t.string "address_lat"
    t.string "conditions"
    t.string "security_number"
    t.string "creator_uuid"
    t.boolean "deleted", default: false
    t.index ["address_lonlat"], name: "index_help_requests_on_address_lonlat", using: :gist
    t.index ["deleted"], name: "index_help_requests_on_deleted"
  end

end
