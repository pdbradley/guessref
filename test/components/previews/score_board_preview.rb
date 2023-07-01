class ScoreBoardPreview < ViewComponent::Preview

  layout 'component_preview'

  def two_players
    Lookbook.data.game_session = fake_score_board.game_session
    render(GameSessionScoreboardComponent.new(fake_score_board))
  end

  private

  def fake_score_board
    game_session = FactoryBot.create(:game_session)
    score_board = FactoryBot.create(:score_board, game_session: game_session)
    score_board.set_score([
      {user_id: 1, name: 'Phil', points: 10},
      {user_id: 2, name: 'Curly', points: 20},
      {user_id: 3, name: 'Moe', points: 30},
      {user_id: 4, name: 'Larry', points: 40},
    ])
    score_board
  end

end
