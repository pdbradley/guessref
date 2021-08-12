class CreateGameSessionScores < ActiveRecord::Migration[6.1]
  def change
    create_table :game_session_scores do |t|
      t.uuid :user_uuid, null: false, index: true
      t.uuid :game_session_uuid, null: false, index: true
      t.integer :score, default: 0, null: false
    end
  end
end
