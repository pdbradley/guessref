class Verse < ApplicationRecord
  belongs_to :game_round
  has_many :verse_words

  def revealed?
    !verse_words.hidden.any?
  end

  def tick!
    if verse = verse_words.hidden.take
      verse.update_attribute(:visible, true)
    end
  end
end
