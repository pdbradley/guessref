class GameRound < ApplicationRecord
  belongs_to :game_session
  has_many :verses
end
