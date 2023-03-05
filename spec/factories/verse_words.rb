FactoryBot.define do
  factory :stubbed_verse_word do
    word_text { Faker::Lorem.word }
    visible { [false, true].sample }
  end

  factory :verse_word do
    verse
    word_text { Faker::Lorem.word }
    visible { [false, true].sample }
  end

end
