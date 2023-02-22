class CreateUserGameSessionScores < ActiveRecord::Migration[7.0]
  def change
    create_table :user_game_session_scores do |t|
      t.references :user, null: false, foreign_key: true
      t.references :game_session, null: false, foreign_key: true
      t.string :name
      t.integer :score, index: true

      t.timestamps
    end
  end
end
