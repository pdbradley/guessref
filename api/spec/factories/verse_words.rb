FactoryBot.define do
  factory :verse_word do
    word_text { "MyString" }
    visible { false }
    verse { nil }
  end
end
