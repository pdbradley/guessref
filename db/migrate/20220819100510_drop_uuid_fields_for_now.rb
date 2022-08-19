class DropUuidFieldsForNow < ActiveRecord::Migration[7.0]
  def change
    remove_column :chat_messages, :game_session_uuid
    remove_column :chat_messages, :user_uuid
    remove_column :game_rounds, :uuid
    remove_column :game_session_scores, :user_uuid
    remove_column :game_session_scores, :game_session_uuid
  end
end
