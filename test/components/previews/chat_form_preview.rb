class ChatFormPreview < ViewComponent::Preview

  layout 'component_preview'

  def visible
    render(ChatFormComponent.new(game_session: game_session))
  end

  private

  def game_session
    FactoryBot.create(:game_session)
  end

end

