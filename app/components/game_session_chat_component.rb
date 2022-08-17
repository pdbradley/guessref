class GameSessionChatComponent < ViewComponent::Base

  def initialize(game_session:)
    @game_session = game_session
    @chat_messages = game_session.game_session_chat_messages
  end

end
