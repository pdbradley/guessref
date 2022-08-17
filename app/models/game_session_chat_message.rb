class GameSessionChatMessage < ApplicationRecord

  after_create_commit -> {
    Broadcast::GameSessionChatMessage.new(self).add_to_game_session
  }

  belongs_to :game_session
  belongs_to :user
end
