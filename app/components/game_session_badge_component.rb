# frozen_string_literal: true

class GameSessionBadgeComponent < ViewComponent::Base

  def initialize(game_session:)
    @game_session = game_session
  end


end