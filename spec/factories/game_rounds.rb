FactoryBot.define do
  factory :game_round do
    association :game_session, status: GameSession::ACTIVE_STATUS
    status { GameRound::STATUSES.sample }
  end
end
