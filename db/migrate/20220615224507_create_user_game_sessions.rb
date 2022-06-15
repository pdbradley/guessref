class CreateUserGameSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_game_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game_session, null: false, foreign_key: true

      t.timestamps
    end

    add_index :user_game_sessions, [:user_id, :game_session_id], unique: true
  end
end
