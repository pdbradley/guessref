class Verse < ApplicationRecord
  belongs_to :game_round
  has_many :verse_words
end
