class User < ApplicationRecord
  has_many :user_game_sessions
  has_many :game_sessions, through: :user_game_sessions
end
