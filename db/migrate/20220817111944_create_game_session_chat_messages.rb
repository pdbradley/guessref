class CreateGameSessionChatMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :game_session_chat_messages do |t|
      t.references :game_session, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :body

      t.timestamps
    end
  end
end
