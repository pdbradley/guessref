class Verse < ApplicationRecord
  belongs_to :game_round
  has_many :verse_words

  QUEUED_STATUS = 'QUEUED'
  ACTIVE_STATUS = 'ACTIVE'
  COMPLETED_STATUS = 'COMPLETED'
  STATUSES = [QUEUED_STATUS, ACTIVE_STATUS, COMPLETED_STATUS]

  def self.queued
    where(status: QUEUED_STATUS)
  end

  def self.active
    where(status: ACTIVE_STATUS)
  end

  def self.completed
    where(status: COMPLETED_STATUS)
  end

  def completed?
    self.status == COMPLETED_STATUS
  end

  def tick!
    if next_hidden_word
      set_active!
      next_hidden_word.visible!
    else
      set_complete!
    end
  end

  def next_hidden_word
    verse_words.hidden.take
  end

  def set_active!
    update_attribute(:status, ACTIVE_STATUS) unless status == ACTIVE_STATUS
  end

  def set_complete!
    update_attribute(:status, COMPLETED_STATUS)
  end

end
