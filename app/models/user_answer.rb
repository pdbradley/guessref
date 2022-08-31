class UserAnswer < ApplicationRecord
  belongs_to :game_session
  belongs_to :user
  belongs_to :verse
  belongs_to :book_answer, optional: true
  belongs_to :chapter_answer, optional: true
  belongs_to :verse_answer, optional: true
end
