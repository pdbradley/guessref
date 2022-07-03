class GameSessionPreview < ViewComponent::Preview

  layout 'component_preview'

  def visible
    render(GameSessionComponent.new(game_session: game_session_lobby_status))
  end

  private

  def game_session_lobby_status
    game_session = FactoryBot.create(:game_session)
    game_session.fill_in_game_info
    game_session.status = GameSession::LOBBY_STATUS
    game_session
  end

end
