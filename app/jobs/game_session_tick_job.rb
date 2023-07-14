class GameSessionTickJob < ApplicationJob
  queue_as :default

  def perform(uuid)
    if game_session = GameSession.find_by(uuid: uuid)
      game_session.tick!
    end
  end
end
