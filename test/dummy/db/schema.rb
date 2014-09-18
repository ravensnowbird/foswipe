# encoding: UTF-8
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


ActiveRecord::Schema.define(version: 20140918102238) do

  create_table "foswipe_attachments", force: true do |t|
    t.string   "attachment_uid"
    t.string   "attachable_type"
    t.integer  "attachable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foswipe_comment_attachments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_uid"
    t.integer  "comment_id"
  end

  create_table "foswipe_comments", force: true do |t|
    t.text     "content"
    t.string   "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ticket_id"
    t.string   "type"
    t.string   "message_id"
  end

  add_index "foswipe_comments", ["message_id"], name: "index_foswipe_comments_on_message_id"

  create_table "foswipe_organizations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foswipe_products", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foswipe_projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "duration"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foswipe_purchases", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
    t.integer  "product_id"
  end

  add_index "foswipe_purchases", ["organization_id"], name: "index_foswipe_purchases_on_organization_id"
  add_index "foswipe_purchases", ["product_id"], name: "index_foswipe_purchases_on_product_id"

  create_table "foswipe_slas", force: true do |t|
    t.string   "priority"
    t.string   "respondwith"
    t.string   "resolvewith"
    t.string   "operationalhours"
    t.string   "esclate"
    t.integer  "slas_id"
    t.string   "slas_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foswipe_ticket_attachments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_uid"
    t.integer  "ticket_id"
  end

  add_index "foswipe_ticket_attachments", ["ticket_id"], name: "index_foswipe_ticket_attachments_on_ticket_id"

  create_table "foswipe_tickets", force: true do |t|
    t.text     "content"
    t.integer  "client_id"
    t.integer  "support_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.text     "support_notes"
    t.string   "title"
    t.string   "priority"
    t.integer  "user_group_id"
    t.string   "message_id"
  end

  add_index "foswipe_tickets", ["client_id"], name: "index_foswipe_tickets_on_client_id"
  add_index "foswipe_tickets", ["message_id"], name: "index_foswipe_tickets_on_message_id"
  add_index "foswipe_tickets", ["support_id"], name: "index_foswipe_tickets_on_support_id"
  add_index "foswipe_tickets", ["user_group_id"], name: "index_foswipe_tickets_on_user_group_id"

  create_table "foswipe_todos", force: true do |t|
    t.text     "content"
    t.integer  "ticket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "foswipe_todos", ["ticket_id"], name: "index_foswipe_todos_on_ticket_id"

  create_table "foswipe_user_groups", force: true do |t|
    t.string   "group_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foswipe_user_groups_users", force: true do |t|
    t.integer "user_id"
    t.integer "user_group_id"
  end

  add_index "foswipe_user_groups_users", ["user_group_id"], name: "index_foswipe_user_groups_users_on_user_group_id"
  add_index "foswipe_user_groups_users", ["user_id"], name: "index_foswipe_user_groups_users_on_user_id"

  create_table "foswipe_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "mobile_no"
    t.string   "gender"
    t.boolean  "agent"
    t.boolean  "admin"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "organization_id"
  end

  add_index "foswipe_users", ["email"], name: "index_foswipe_users_on_email", unique: true
  add_index "foswipe_users", ["organization_id"], name: "index_foswipe_users_on_organization_id"
  add_index "foswipe_users", ["reset_password_token"], name: "index_foswipe_users_on_reset_password_token", unique: true

end
