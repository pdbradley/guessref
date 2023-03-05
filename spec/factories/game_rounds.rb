FactoryBot.define do
  factory :stubbed_game_round do
    status { GameRound::STATUSES.sample }

    transient do 
      verses_count { 5 }
    end

    verses do
      Array.new(verses_count) { association(:verse) }
    end
  end

  factory :game_round do
    status { GameRound::STATUSES.sample }

    game_session
  end
end
