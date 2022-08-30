class GameRoundTickJob < ApplicationJob
  queue_as :default

  def perform(id)
    if game_round = GameRound.find_by(id: id)
      game_round.tick!
    end
  end
end
