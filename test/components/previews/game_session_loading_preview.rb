class GameSessionLoadingPreview < ViewComponent::Preview

  layout 'component_preview'

  def pre_game
    render(GameSessionLoadingComponent.new(game_session: game_session_loading_status))
  end

  private

  def game_session_loading_status
    # game_session = FactoryBot.create(:game_session, :with_players, num_players: 3,  status: GameSession::LOBBY_STATUS)
    # game_session = FactoryBot.create(:game_session, :with_players, num_players: 4)
    # game_session = FactoryBot.build_stubbed(:game_session, :with_players, num_players: 4)
    game_session = FactoryBot.build_stubbed(:game_session)
    game_session
  end

end

