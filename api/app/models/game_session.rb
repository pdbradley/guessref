class GameSession < ApplicationRecord
  has_many :game_rounds

  def tick!
    if completed?
      close_game
      return
    end

    current_round.tick! if current_round
  end

  def start!
    # need tests so this doesn't start a game that already started or is over
    tick! unless completed
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

end
