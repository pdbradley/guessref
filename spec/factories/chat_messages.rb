FactoryBot.define do
  factory :chat_message do
    message { Faker::Quote.jack_handey }
  end
end
