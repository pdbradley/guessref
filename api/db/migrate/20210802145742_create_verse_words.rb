class CreateVerseWords < ActiveRecord::Migration[6.1]
  def change
    create_table :verse_words do |t|
      t.string :word_text
      t.boolean :visible
      t.references :verse, null: false, foreign_key: true

      t.timestamps
    end
  end
end
