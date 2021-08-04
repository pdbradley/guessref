class GameSessionTickJob < ApplicationJob
  queue_as :default

  def perform(uuid)
    GameSession.find_by(uuid: uuid).tick!
  end
end
