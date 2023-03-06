FactoryBot.define do
  factory :stubbed_verse, class: "Verse" do
    book_number { 1 }
    chapter_number { 1 }
    verse_number { 1 }


    book_answers do
      Array.new(4) { association(:book_answer) }
    end

    chapter_answers do
      Array.new(4) { association(:chapter_answer) }
    end

    verse_answers do
      Array.new(4) { association(:verse_answer) }
    end

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
