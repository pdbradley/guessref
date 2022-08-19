# frozen_string_literal: true

class ChatMessageComponent < ViewComponent::Base

  def initialize(chat_message)
    @chat_message = chat_message
    @user = @chat_message.user
  end
end
