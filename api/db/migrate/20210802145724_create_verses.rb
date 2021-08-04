class CreateVerses < ActiveRecord::Migration[6.1]
  def change
    create_table :verses do |t|
      t.references :game_round, null: false, foreign_key: true
      t.integer :book_number
      t.integer :chapter_number
      t.integer :verse_number

      t.timestamps
    end
  end
end
