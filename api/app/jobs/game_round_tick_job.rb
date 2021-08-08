class GameRoundTickJob < ApplicationJob
  queue_as :default

  def perform(uuid)
    if verse = GameRound.find_by(uuid: uuid)
      verse.tick!
    end
  end
end
