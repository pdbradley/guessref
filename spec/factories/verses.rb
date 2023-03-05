FactoryBot.define do
  factory :stubbed_verse do
    book_number { 1 }
    chapter_number { 1 }
    verse_number { 1 }

    transient do
      verse_words_count { 10 }
    end

    verse_words do
      Array.new(verse_words_count) { association(:verse_word) }
    end
  end

  factory :verse do
    book_number { 1 }
    chapter_number { 1 }
    verse_number { 1 }
    game_round
  end

end
