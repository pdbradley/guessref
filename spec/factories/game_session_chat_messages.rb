FactoryBot.define do
  factory :game_session_chat_message do
    body { Faker::Quote.jack_handey }
  end
end
