class AddUuidsToModels < ActiveRecord::Migration[6.1]
  def change
    add_column :verses, :uuid, :uuid, default: 'uuid_generate_v1()', null: false, index: true
    add_column :game_rounds, :uuid, :uuid, default: 'uuid_generate_v1()', null: false, index: true
    add_column :verse_words, :uuid, :uuid, default: 'uuid_generate_v1()', null: false, index: true
    add_column :book_answers, :uuid, :uuid, default: 'uuid_generate_v1()', null: false, index: true
    add_column :chapter_answers, :uuid, :uuid, default: 'uuid_generate_v1()', null: false, index: true
    add_column :verse_answers, :uuid, :uuid, default: 'uuid_generate_v1()', null: false, index: true
  end
end
