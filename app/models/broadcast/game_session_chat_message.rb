include ActionView::RecordIdentifier
module Broadcast
  class GameSessionChatMessage

    def initialize(game_session_chat_message)
      @game_session_chat_message = game_session_chat_message
      @user = game_session_chat_message.user
      @game_session = game_session_chat_message.game_session
    end

    def add_to_game_session
      Turbo::StreamsChannel.broadcast_append_later_to(
        @game_session,
        target: "game-session-chat-messages",
        html: chat_message_component
      )
    end

    def remove_from_game_session
      Turbo::StreamsChannel.broadcast_remove_to(
        @game_session,
        target: @game_session_chat_message
      )
    end

    private

    def chat_message_component
      ApplicationController.render(
        GameSessionChatMessageComponent.new(@game_session_chat_message),
        layout: false
      )
    end
  end
end

