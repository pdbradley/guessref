class GameSession < ApplicationRecord

  has_many :game_rounds

  LOBBY_STATUS = 'LOBBY'
  ACTIVE_STATUS= 'ACTIVE'
  COMPLETED_STATUS = 'COMPLETED'
  STATUSES = [LOBBY_STATUS, ACTIVE_STATUS, COMPLETED_STATUS]

  def tick!
    if lobby?
      lobby_tick!
    elsif active?
      active_tick!
    elsif completed?
      completed_tick!
    else
      raise "game session has unknown status should not have status #{self.status}"
    end
  end

  def lobby_tick!
    active!
    GameSessionTickJob.set(wait: 3.seconds).perform_later(self.uuid)
  end

  def active_tick!
    if current_round
      GameRoundTickJob.set(wait: 3.seconds).perform_later(current_round.uuid)
    else
      completed!
    end
  end

  def completed_tick!
    # nothing?
  end

  def current_round
    remaining_rounds.first
  end

  def remaining_rounds
    game_rounds.active + game_rounds.queued
  end

  def fill_in_game_info # this is temporary
    3.times do
      game_rounds.create(status: GameRound::QUEUED_STATUS)
    end

    game_rounds.each do |game_round|
      5.times do
        verse = game_round.verses.create
        verse.random_from_fixture
      end
    end
  end

  private

  def lobby?
    self.status == LOBBY_STATUS
  end

  def active?
    self.status == ACTIVE_STATUS
  end

  def completed?
    self.status == COMPLETED_STATUS
  end

  def active!
    update_attribute(:status, ACTIVE_STATUS)
  end

  def completed!
    update_attribute(:status, COMPLETED_STATUS)
  end

  def close_game
    update_attribute(:status, COMPLETED_STATUS)
  end

end
