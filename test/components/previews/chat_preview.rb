class ChatPreview < ViewComponent::Preview

  layout 'component_preview'

  def visible
    render(ChatComponent.new(game_session: game_session))
  end

  private

  def game_session
    game_session = FactoryBot.create(:game_session)
    7.times do
      FactoryBot.create(:chat_message, game_session: game_session, user: FactoryBot.create(:user))
    end
    game_session
  end

end
