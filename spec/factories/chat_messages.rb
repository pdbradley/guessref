FactoryBot.define do
  factory :chat_message do
    game_session_uuid { "" }
    user_uuid { "MyString" }
    message { "MyString" }
  end
end
