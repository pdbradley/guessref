FactoryBot.define do
  factory :verse_word do
    word_text { Faker::Lorem.word }
    visible { [false, true].sample }
  end
end
