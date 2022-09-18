class CreateUserAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_answers do |t|
      t.references :game_session, null: false, foreign_key: true
      t.references :game_round, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :verse, null: false, foreign_key: true
      t.references :book_answer, foreign_key: true
      t.references :chapter_answer, foreign_key: true
      t.references :verse_answer, foreign_key: true
      t.integer :answer_point_value, null: false, default: 0


      t.timestamps
    end
  end
end
