class GameSessionChatMessage < ApplicationRecord

  after_create_commit -> {
    broadcast_append_later_to(game_session, target: 'game-session-chat-messages', html: 'hi')
  }

  belongs_to :game_session
  belongs_to :user
end
