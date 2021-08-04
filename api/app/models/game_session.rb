class GameSession < ApplicationRecord
  has_many :game_rounds

  def tick!
    if completed?
      close_game
      return
    end

    increment_tick_count
    current_round.tick!
  end

  def current_round
    next_rounds.first
  end

  def next_rounds
    game_rounds.active + game_rounds.queued
  end

  def completed?
    self.completed || !current_round
  end

  private

  def close_game
    # probably will become a ClosesGame class
    update_attribute(:completed, true) if !self.completed
  end

  def increment_tick_count
    update_attribute(:tick, self.tick + 1)
  end

end
