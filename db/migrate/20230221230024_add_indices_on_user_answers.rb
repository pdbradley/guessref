class AddIndicesOnUserAnswers < ActiveRecord::Migration[7.0]
  def change
    # really wanted to enforce at the DB level some indices
    # that would only allow one answer per category (book / chap / verse)
    # per verse question.
    # https://stackoverflow.com/questions/8289100/create-unique-constraint-with-null-columns/8289253#8289253
    # But not really worth it.  just going to enforce the constraint
    # at the rails model level
    add_index :user_answers, :created_at
  end
end
