FactoryBot.define do
  factory :game_session do
    name { Faker::Emotion.noun.capitalize }
    tick { 0 }
  end
end
