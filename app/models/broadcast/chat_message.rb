include ActionView::RecordIdentifier
module Broadcast
  class ChatMessage

    def initialize(chat_message)
      @chat_message = chat_message
      @user = chat_message.user
      @game_session = chat_message.game_session
    end

    def add_to_game_session
      Turbo::StreamsChannel.broadcast_append_later_to(
        @game_session,
        target: "chat-messages",
        html: chat_message_component
      )
    end

    def remove_from_game_session
      Turbo::StreamsChannel.broadcast_remove_to(
        @game_session,
        target: @chat_message
      )
    end

    private

    def chat_message_component
      ApplicationController.render(
        ChatMessageComponent.new(@chat_message),
        layout: false
      )
    end
  end
end

