FactoryBot.define do
  factory :chapter_answer do
    verse { nil }
    point_value { 1 }
    correct { false }
    label { "MyString" }
  end
end
