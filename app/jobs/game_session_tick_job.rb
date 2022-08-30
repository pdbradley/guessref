class GameSessionTickJob < ApplicationJob
  queue_as :default

  def perform(id)
    if game_session = GameSession.find_by(id: id)
      game_session.tick!
    end
  end
end
