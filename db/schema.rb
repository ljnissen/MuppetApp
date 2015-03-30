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

ActiveRecord::Schema.define(version: 20150328094418) do

  create_table "answers", force: :cascade do |t|
    t.text     "First_answer",  limit: 250
    t.text     "string",        limit: 250
    t.string   "Second_answer", limit: 300
    t.string   "Third_answer",  limit: 300
    t.string   "Fourth_answer", limit: 300
    t.string   "Fifth_answer",  limit: 350
    t.string   "Sixth_answer",  limit: 350
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "gonzos", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.text     "question"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
