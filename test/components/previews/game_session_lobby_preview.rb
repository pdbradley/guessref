class GameSessionLobbyPreview < ViewComponent::Preview

  layout 'component_preview'

  def visible
    render(GameSessionLobbyComponent.new(game_session: game_session_lobby_status))
  end

  private

  def game_session_lobby_status
    # game_session = FactoryBot.create(:game_session, :with_players, num_players: 3,  status: GameSession::LOBBY_STATUS)
    game_session = FactoryBot.create(:game_session, :with_players, num_players: 5)
    game_session.fill_in_game_info
    game_session
  end

end
