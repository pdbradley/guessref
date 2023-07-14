class CreateGameRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :game_rounds do |t|
      t.references :game_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
