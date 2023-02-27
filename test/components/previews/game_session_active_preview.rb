class GameSessionActivePreview < ViewComponent::Preview

  layout 'component_preview'

  def active
    render(GameSessionActiveComponent.new(game_session: active_game_session))
  end

  private

  def active_game_session
    game_session = FactoryBot.build_stubbed(:game_session)
    game_session.status = GameSession::ACTIVE_STATUS
    game_session
  end

end

