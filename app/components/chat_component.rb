class ChatComponent < ViewComponent::Base

  def initialize(game_session:)
    @game_session = game_session
    @chat_messages = game_session.chat_messages
  end

end
