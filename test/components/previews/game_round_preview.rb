class GameRoundPreview < ViewComponent::Preview

  layout 'component_preview'

  def queued
    render(GameRoundComponent.new(game_round: queued_round))
  end

  def active
    render(GameRoundComponent.new(game_round: active_round))
  end

  def completed
    render(GameRoundComponent.new(game_round: completed_round))
  end

  private

  def queued_round
    game_round = FactoryBot.create(:game_round, status: GameRound::QUEUED_STATUS)
  end

  def active_round
    game_round = FactoryBot.create(:game_round, status: GameRound::ACTIVE_STATUS)
    game_round.game_session.fill_in_game_info
    game_round
  end

  def completed_round
    game_round = FactoryBot.create(:game_round, status: GameRound::COMPLETED_STATUS)
  end

end

