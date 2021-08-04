FactoryBot.define do
  factory :verse_word do
    word_text { 'Rando' }
    visible { false }
    verse { nil }
  end

end
