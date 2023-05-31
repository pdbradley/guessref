FactoryBot.define do
  factory :game_session do
    name { Faker::Emotion.noun.capitalize }
    tick { 0 }
  end

  # factory :stubbed_game_session do
  #   name { Faker::Emotion.noun.capitalize }
  #   tick { 0 }

  #   # transient do
  #   #   game_rounds_count { 5 }
  #   # end

  #   # game_rounds do
  #   #   Array.new(game_rounds_count) { association(:game_round) }
  #   # end
  # end

  trait :with_one_question do
    after(:create) do |game_session|
      game_round = create(:game_round, game_session: game_session)
      verse = create(:verse, game_round: game_round)
      AddsVerseInfoFromFixture.new(verse).fill_in_verse_with_random_info
    end
  end

  # todo make this build_stubbable
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
end
