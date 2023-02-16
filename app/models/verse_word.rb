class VerseWord < ApplicationRecord

  after_update_commit -> {
    Broadcast::VerseWord.update(self)
  }

  belongs_to :verse

  def game_session
    verse&.game_session
  end

  def self.hidden
    where(visible: false)
  end

  def self.random
    order("RANDOM()")  
  end

  def self.invisible
    hidden
  end

  def self.visible
    where(visible: true)
  end

  def visible!
    update_attribute(:visible, true)
  end
end
