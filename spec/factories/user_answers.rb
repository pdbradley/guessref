FactoryBot.define do
  factory :user_answer do
    game_session { nil }
    user { nil }
    verse { nil }
    book_answer { nil }
    chapter_answer { nil }
    verse_answer { nil }
  end
end
