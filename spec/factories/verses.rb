FactoryBot.define do
  factory :verse do
    game_round
    book_number { 1 }
    chapter_number { 1 }
    verse_number { 1 }

    factory :verse_with_verse_words do
      transient do
        verse_words_count { 10 }
      end

      verse_words do
        Array.new(verse_words_count) { association(:verse_word) }
      end
    end
  end
end
