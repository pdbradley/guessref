FactoryBot.define do
  factory :user_game_session_score do
    user { nil }
    game_session { nil }
    name { "MyString" }
    score { 1 }
  end
end
