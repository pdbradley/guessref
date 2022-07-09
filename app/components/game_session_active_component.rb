class GameSessionActiveComponent < ViewComponent::Base
  def initialize(game_session:)
    @game_session = game_session
  end

end
