class User < ApplicationRecord
  has_many :user_game_sessions
  has_many :game_sessions, through: :user_game_sessions

  before_create :set_color

  private

  def set_color
    self.color = ColorPicker.random
  end
end
