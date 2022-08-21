FactoryBot.define do
  factory :game_session do
    name { Faker::Emotion.noun.capitalize }
    tick { 0 }
  end

  trait :with_one_question do
    after(:create) do |game_session|
      game_round = create(:game_round, game_session: game_session)
      verse = create(:verse, game_round: game_round)
      verse.random_from_fixture
    end
  end

  trait :with_players do
    transient do
      num_players { 3 }
    end

    after(:create) do |game_session, evaluator|
      evaluator.num_players.times do
        user = create(:user)
        game_session.users << user
      end
    end
  end
  #
  #   after(:create) do |game_session, evaluator|
  #     evaluator.num_players.times do
  #       user = create_list :user
  #       game_session.users << user
  #     end
  #   end
  # end
end
