FactoryBot.define do
  factory :game_session_chat_message do
    game_session { nil }
    user { nil }
    body { "MyString" }
  end
end
