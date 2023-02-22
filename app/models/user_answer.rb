class UserAnswer < ApplicationRecord
  belongs_to :game_session
  belongs_to :game_round
  belongs_to :user
  belongs_to :verse
  belongs_to :book_answer, optional: true
  belongs_to :chapter_answer, optional: true
  belongs_to :verse_answer, optional: true

  validates :game_session, :game_round, :user, :verse, :answer_point_value, presence: true
  validate :only_attached_to_one?

  private

  def only_attached_to_one?
    if [book_answer_id, chapter_answer_id, verse_answer_id].compact.size != 1
      errors.add :base, "must be attached to one of book, chapter, or verse"
    end
  end

end
