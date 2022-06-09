FactoryBot.define do
  factory :verse do
    game_round
    book_number { 1 }
    chapter_number { 1 }
    verse_number { 1 }

    trait :with_verse_words do
      after(:create) do |verse|
        verse.random_from_fixture
      end
    end
  end
end
