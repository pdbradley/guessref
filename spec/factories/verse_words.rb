FactoryBot.define do
  factory :verse_word do
    verse
    word_text { Faker::Lorem.word }
    visible { [false, true].sample }
  end
end
