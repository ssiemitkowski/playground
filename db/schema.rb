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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120907145621) do

  create_table "accounts", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "kontos", :force => true do |t|
    t.string   "title"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "role"
    t.string   "status"
    t.string   "benutzername"
    t.string   "benutzerkennung"
    t.string   "firma"
    t.string   "anrede"
    t.string   "vorname"
    t.string   "nachname"
    t.string   "strasse"
    t.string   "hausnummer"
    t.decimal  "postleitzahl"
    t.string   "ort"
    t.string   "land"
    t.string   "zeitzone"
    t.string   "telefon"
    t.string   "mobile"
    t.string   "steuernummer"
    t.date     "geburtsdatum"
  end

end
