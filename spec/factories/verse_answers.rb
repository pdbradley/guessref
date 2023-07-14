FactoryBot.define do
  factory :verse_answer do
    verse { nil }
    point_value { 1 }
    correct { false }
    label { "MyString" }
  end
end
