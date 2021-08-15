class AddVerseTextToVerses < ActiveRecord::Migration[6.1]
  def change
    add_column :verses, :verse_text, :string
  end
end
