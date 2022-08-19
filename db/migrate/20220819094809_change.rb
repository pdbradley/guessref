class Change < ActiveRecord::Migration[7.0]
  def change
    drop_table :game_session_chat_messages
  end
end
