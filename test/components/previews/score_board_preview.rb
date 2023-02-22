class ScoreBoardPreview < ViewComponent::Preview

  layout 'component_preview'

  def two_players
    render(GameSessionScoreboardComponent.new(fake_scores(2)))
  end

  private

  def fake_scores(num)
    num.times.map { [Faker::Name.first_name, 12] }.to_h
  end

end
