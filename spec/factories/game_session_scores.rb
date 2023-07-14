FactoryBot.define do
  factory :game_session_score do
    user_uuid { "" }
    game_session_uuid { "" }
    score { 1 }
  end
end
