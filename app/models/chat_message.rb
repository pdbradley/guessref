class ChatMessage < ApplicationRecord

  after_create_commit -> {
    Broadcast::ChatMessage.new(self).add_to_game_session
  }

  belongs_to :game_session
  belongs_to :user
end
