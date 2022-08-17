# frozen_string_literal: true

class GameSessionChatMessageComponent < ViewComponent::Base

  def initialize(chat_message:)
    @chat_message = chat_message
  end
end
