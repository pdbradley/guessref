class GameRound < ApplicationRecord
  belongs_to :game_session
  has_many :verses

  QUEUED_STATUS = 'QUEUED'
  ACTIVE_STATUS = 'ACTIVE'
  COMPLETED_STATUS = 'COMPLETED'
  STATUSES = [QUEUED_STATUS, ACTIVE_STATUS, COMPLETED_STATUS]

  def tick!
    if current_verse
      current_verse.tick!
    else
      complete!
    end
  end

  def completed?
    status == COMPLETED_STATUS
  end

  def self.queued
    where(status: QUEUED_STATUS)
  end

  def self.active
    where(status: ACTIVE_STATUS)
  end

  def self.completed
    where(status: COMPLETED_STATUS)
  end

  def complete!
    update_attribute(:status, COMPLETED_STATUS)
  end

  def next_verses
    verses.active + verses.queued
  end

  def current_verse
    next_verses.first
  end

end
