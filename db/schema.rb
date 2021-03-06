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

ActiveRecord::Schema.define(version: 20160125025342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "cover_images", force: :cascade do |t|
    t.string  "file"
    t.string  "title"
    t.integer "portfolio_id"
  end

  create_table "feature_flippers", force: :cascade do |t|
    t.boolean "active"
    t.string  "name"
    t.integer "page_id"
  end

  add_index "feature_flippers", ["name"], name: "index_feature_flippers_on_name", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "images", force: :cascade do |t|
    t.string  "title"
    t.string  "file"
    t.integer "portfolio_id"
    t.integer "post_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string  "sender_name"
    t.string  "sender_email"
    t.string  "subject"
    t.text    "body"
    t.boolean "read",         default: false
  end

  create_table "meta_tags", force: :cascade do |t|
    t.string "attr"
    t.text   "content"
    t.string "attr_value"
    t.string "tag_type"
    t.string "content_type"
  end

  create_table "meta_tags_pages", id: false, force: :cascade do |t|
    t.integer "meta_tag_id"
    t.integer "page_id"
  end

  add_index "meta_tags_pages", ["meta_tag_id"], name: "index_meta_tags_pages_on_meta_tag_id", using: :btree
  add_index "meta_tags_pages", ["page_id"], name: "index_meta_tags_pages_on_page_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string "name"
    t.string "title_tag"
    t.string "active_nav_tab"
  end

  add_index "pages", ["name"], name: "index_pages_on_name", using: :btree

  create_table "portfolios", force: :cascade do |t|
    t.string   "title"
    t.text     "teaser"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.boolean  "published",  default: false
  end

  add_index "portfolios", ["published"], name: "index_portfolios_on_published", using: :btree
  add_index "portfolios", ["slug"], name: "index_portfolios_on_slug", using: :btree

  create_table "portfolios_roles", id: false, force: :cascade do |t|
    t.integer "portfolio_id"
    t.integer "role_id"
  end

  add_index "portfolios_roles", ["portfolio_id"], name: "index_portfolios_roles_on_portfolio_id", using: :btree
  add_index "portfolios_roles", ["role_id"], name: "index_portfolios_roles_on_role_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "use"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.string   "teaser"
    t.boolean  "published",  default: false
  end

  add_index "posts", ["published"], name: "index_posts_on_published", using: :btree
  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree

  create_table "posts_tags", id: false, force: :cascade do |t|
    t.integer "post_id"
    t.integer "tag_id"
  end

  add_index "posts_tags", ["post_id"], name: "index_posts_tags_on_post_id", using: :btree
  add_index "posts_tags", ["tag_id"], name: "index_posts_tags_on_tag_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string "title"
  end

  create_table "settings", force: :cascade do |t|
    t.string "github"
    t.string "facebook"
    t.string "twitter"
    t.string "stack_overflow"
    t.string "email"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
