class CreateScoreBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :score_boards do |t|
      t.references :game_session
      t.jsonb :scores, default: {}

      t.timestamps
    end
  end
end
