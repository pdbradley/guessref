class GameRound < ApplicationRecord
  belongs_to :game_session
  has_many :verses, dependent: :destroy

  QUEUED_STATUS = 'QUEUED'
  ACTIVE_STATUS = 'ACTIVE'
  COMPLETED_STATUS = 'COMPLETED'
  STATUSES = [QUEUED_STATUS, ACTIVE_STATUS, COMPLETED_STATUS]

  def active?
    status == ACTIVE_STATUS
  end

  def queued?
    status == QUEUED_STATUS
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

  def tick!
    if queued?
      queued_tick!
    elsif active?
      active_tick!
    elsif complete?
      completed_tick!
    else
      raise "game round should not have status #{self.status}"
    end
    game_session.broadcast_update
  end

  def queued_tick!
    if current_verse
      update_attribute(:status, ACTIVE_STATUS)
      current_verse.tick!
    else
      update_attribute(:status, COMPLETED_STATUS)
    end
  end

  def active_tick!
    if current_verse
      current_verse.tick!
    else
      update_attribute(:status, COMPLETED_STATUS)
      game_session.tick!
    end
  end

  def completed_tick!
    update_attribute(:status, COMPLETED_STATUS)
    game_session.tick!
  end


  def next_verses
    verses.active + verses.queued
  end

  def num_verses_remaining
    verses.queued.size
  end

  def current_verse
    next_verses.first
  end

end
