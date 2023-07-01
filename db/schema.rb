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

ActiveRecord::Schema[7.0].define(version: 2023_06_24_204023) do
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

  create_table "chat_messages", force: :cascade do |t|
    t.string "message", default: ""
    t.datetime "created_at", default: -> { "now()" }, null: false
    t.bigint "game_session_id", null: false
    t.bigint "user_id", null: false
    t.index ["game_session_id"], name: "index_chat_messages_on_game_session_id"
    t.index ["user_id"], name: "index_chat_messages_on_user_id"
  end

  create_table "game_rounds", force: :cascade do |t|
    t.bigint "game_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "QUEUED"
    t.index ["game_session_id"], name: "index_game_rounds_on_game_session_id"
  end

  create_table "game_session_scores", force: :cascade do |t|
    t.integer "score", default: 0, null: false
  end

  create_table "game_sessions", force: :cascade do |t|
    t.integer "tick", default: 0
    t.uuid "uuid", default: -> { "uuid_generate_v1()" }, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "creator_uuid"
    t.string "status", default: "LOBBY"
    t.string "name"
    t.index ["uuid"], name: "index_game_sessions_on_uuid"
  end

  create_table "participants", force: :cascade do |t|
    t.uuid "game_session_uuid", null: false
    t.uuid "user_uuid", null: false
    t.index ["game_session_uuid", "user_uuid"], name: "index_participants_on_game_session_uuid_and_user_uuid", unique: true
    t.index ["game_session_uuid"], name: "index_participants_on_game_session_uuid"
    t.index ["user_uuid"], name: "index_participants_on_user_uuid"
  end

  create_table "score_boards", force: :cascade do |t|
    t.bigint "game_session_id"
    t.jsonb "scores", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_session_id"], name: "index_score_boards_on_game_session_id"
  end

  create_table "user_answers", force: :cascade do |t|
    t.bigint "game_session_id", null: false
    t.bigint "game_round_id", null: false
    t.bigint "user_id", null: false
    t.bigint "verse_id", null: false
    t.bigint "book_answer_id"
    t.bigint "chapter_answer_id"
    t.bigint "verse_answer_id"
    t.integer "answer_point_value", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_answer_id"], name: "index_user_answers_on_book_answer_id"
    t.index ["chapter_answer_id"], name: "index_user_answers_on_chapter_answer_id"
    t.index ["created_at"], name: "index_user_answers_on_created_at"
    t.index ["game_round_id"], name: "index_user_answers_on_game_round_id"
    t.index ["game_session_id"], name: "index_user_answers_on_game_session_id"
    t.index ["user_id"], name: "index_user_answers_on_user_id"
    t.index ["verse_answer_id"], name: "index_user_answers_on_verse_answer_id"
    t.index ["verse_id"], name: "index_user_answers_on_verse_id"
  end

  create_table "user_game_session_scores", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "game_session_id", null: false
    t.string "name"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_session_id"], name: "index_user_game_session_scores_on_game_session_id"
    t.index ["score"], name: "index_user_game_session_scores_on_score"
    t.index ["user_id"], name: "index_user_game_session_scores_on_user_id"
  end

  create_table "user_game_sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "game_session_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_session_id"], name: "index_user_game_sessions_on_game_session_id"
    t.index ["user_id", "game_session_id"], name: "index_user_game_sessions_on_user_id_and_game_session_id", unique: true
    t.index ["user_id"], name: "index_user_game_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.uuid "uuid", default: -> { "uuid_generate_v1()" }, null: false
    t.string "color", default: "black"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "uuid", default: -> { "uuid_generate_v1()" }, null: false
    t.index ["verse_id"], name: "index_verse_words_on_verse_id"
  end

  create_table "verses", force: :cascade do |t|
    t.bigint "game_round_id", null: false
    t.integer "book_number"
    t.integer "chapter_number"
    t.integer "verse_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "QUEUED"
    t.uuid "uuid", default: -> { "uuid_generate_v1()" }, null: false
    t.string "verse_text"
    t.index ["game_round_id"], name: "index_verses_on_game_round_id"
  end

  add_foreign_key "book_answers", "verses"
  add_foreign_key "chapter_answers", "verses"
  add_foreign_key "chat_messages", "game_sessions"
  add_foreign_key "chat_messages", "users"
  add_foreign_key "game_rounds", "game_sessions"
  add_foreign_key "user_answers", "book_answers"
  add_foreign_key "user_answers", "chapter_answers"
  add_foreign_key "user_answers", "game_rounds"
  add_foreign_key "user_answers", "game_sessions"
  add_foreign_key "user_answers", "users"
  add_foreign_key "user_answers", "verse_answers"
  add_foreign_key "user_answers", "verses"
  add_foreign_key "user_game_session_scores", "game_sessions"
  add_foreign_key "user_game_session_scores", "users"
  add_foreign_key "user_game_sessions", "game_sessions"
  add_foreign_key "user_game_sessions", "users"
  add_foreign_key "verse_answers", "verses"
  add_foreign_key "verse_words", "verses"
  add_foreign_key "verses", "game_rounds"
end
