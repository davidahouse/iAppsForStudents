# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100724160805) do

  create_table "applications", :force => true do |t|
    t.string   "title"
    t.integer  "company_id"
    t.string   "description"
    t.string   "image_file"
    t.string   "url"
    t.string   "discount_code"
    t.string   "platform"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "list_price",        :precision => 8, :scale => 2
    t.decimal  "sale_price",        :precision => 8, :scale => 2
    t.string   "price_currency"
    t.decimal  "discount",          :precision => 8, :scale => 2
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
  end

  create_table "companies", :force => true do |t|
    t.string   "title"
    t.string   "email"
    t.string   "reg_code"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
