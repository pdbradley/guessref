# frozen_string_literal: true

class GameSessionLoadingComponent < ViewComponent::Base
  def initialize(game_session:)
    @game_session = game_session
  end

end
