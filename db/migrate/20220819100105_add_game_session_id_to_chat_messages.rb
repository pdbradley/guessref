class AddGameSessionIdToChatMessages < ActiveRecord::Migration[7.0]
  def change
    add_reference :chat_messages, :game_session, null: false, foreign_key: true
    add_reference :chat_messages, :user, null: false, foreign_key: true
  end
end
