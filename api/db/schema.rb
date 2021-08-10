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

ActiveRecord::Schema.define(version: 2021_08_10_144348) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "book_answers", force: :cascade do |t|
    t.bigint "verse_id", null: false
    t.integer "point_value"
    t.boolean "correct", default: false
    t.string "label"
    t.uuid "uuid", default: -> { "uuid_generate_v1()" }, null: false
    t.index ["correct"], name: "index_book_answers_on_correct"
    t.index ["verse_id"], name: "index_book_answers_on_verse_id"
  end

  create_table "chapter_answers", force: :cascade do |t|
    t.bigint "verse_id", null: false
    t.integer "point_value"
    t.boolean "correct", default: false
    t.string "label"
    t.uuid "uuid", default: -> { "uuid_generate_v1()" }, null: false
    t.index ["correct"], name: "index_chapter_answers_on_correct"
    t.index ["verse_id"], name: "index_chapter_answers_on_verse_id"
  end

  create_table "game_rounds", force: :cascade do |t|
    t.bigint "game_session_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "QUEUED"
    t.uuid "uuid", default: -> { "uuid_generate_v1()" }, null: false
    t.index ["game_session_id"], name: "index_game_rounds_on_game_session_id"
  end

  create_table "game_sessions", force: :cascade do |t|
    t.integer "tick", default: 0
    t.uuid "uuid", default: -> { "uuid_generate_v1()" }, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "creator_uuid"
    t.string "status", default: "LOBBY"
    t.index ["uuid"], name: "index_game_sessions_on_uuid"
  end

  create_table "participants", force: :cascade do |t|
    t.uuid "game_session_uuid", null: false
    t.uuid "user_uuid", null: false
    t.index ["game_session_uuid"], name: "index_participants_on_game_session_uuid"
    t.index ["user_uuid"], name: "index_participants_on_user_uuid"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.uuid "uuid", default: -> { "uuid_generate_v1()" }, null: false
    t.index ["uuid"], name: "index_users_on_uuid"
  end

  create_table "verse_answers", force: :cascade do |t|
    t.bigint "verse_id", null: false
    t.integer "point_value"
    t.boolean "correct", default: false
    t.string "label"
    t.uuid "uuid", default: -> { "uuid_generate_v1()" }, null: false
    t.index ["correct"], name: "index_verse_answers_on_correct"
    t.index ["verse_id"], name: "index_verse_answers_on_verse_id"
  end

  create_table "verse_words", force: :cascade do |t|
    t.string "word_text"
    t.boolean "visible"
    t.bigint "verse_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.uuid "uuid", default: -> { "uuid_generate_v1()" }, null: false
    t.index ["verse_id"], name: "index_verse_words_on_verse_id"
  end

  create_table "verses", force: :cascade do |t|
    t.bigint "game_round_id", null: false
    t.integer "book_number"
    t.integer "chapter_number"
    t.integer "verse_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status", default: "QUEUED"
    t.uuid "uuid", default: -> { "uuid_generate_v1()" }, null: false
    t.index ["game_round_id"], name: "index_verses_on_game_round_id"
  end

  add_foreign_key "book_answers", "verses"
  add_foreign_key "chapter_answers", "verses"
  add_foreign_key "game_rounds", "game_sessions"
  add_foreign_key "verse_answers", "verses"
  add_foreign_key "verse_words", "verses"
  add_foreign_key "verses", "game_rounds"
end
