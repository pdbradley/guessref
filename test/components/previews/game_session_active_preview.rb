class GameSessionActivePreview < ViewComponent::Preview

  layout 'component_preview'

  def visible
    render(GameSessionActiveComponent.new(game_session: active_game_session))
  end

  private

  def active_game_session
    game_session = FactoryBot.create(:game_session)
    game_session.fill_in_game_info
    game_session.status = GameSession::ACTIVE_STATUS
    game_session
  end

end

