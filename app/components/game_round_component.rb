# frozen_string_literal: true

class GameRoundComponent < ViewComponent::Base
  def initialize(game_round:)
    @game_round = game_round
  end

  def render?
    @game_round
  end

end
