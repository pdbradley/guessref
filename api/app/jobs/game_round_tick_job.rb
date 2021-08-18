class GameRoundTickJob < ApplicationJob
  queue_as :default

  def perform(uuid)
    if game_round = GameRound.find_by(uuid: uuid)
      game_round.tick!
    end
  end
end
