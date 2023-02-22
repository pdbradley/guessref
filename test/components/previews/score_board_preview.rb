class ScoreBoardPreview < ViewComponent::Preview

  layout 'component_preview'

  def basic
    render(GameSessionScoreboardComponent.new({}))
  end

end
