class CreateBookAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :book_answers do |t|
      t.references :verse, null: false, foreign_key: true
      t.integer :point_value
      t.boolean :correct, default: false, index: true
      t.string :label
    end
  end
end
