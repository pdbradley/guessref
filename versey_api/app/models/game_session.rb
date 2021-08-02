class GameSession < ApplicationRecord

  def tick!
    increment_tick
  end

  def completed?
    tick > 10
  end

  def start!
    tick!
  end

  def increment_tick
    update_attribute(:tick, self.tick + 1)
  end

end
