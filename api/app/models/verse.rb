class Verse < ApplicationRecord
  belongs_to :game_round
  has_one :game_session, through: :game_round
  has_many :verse_words
  has_many :book_answers
  has_many :chapter_answers
  has_many :verse_answers

  QUEUED_STATUS = 'QUEUED'
  ACTIVE_STATUS = 'ACTIVE'
  COMPLETED_STATUS = 'COMPLETED'
  REVEALED_STATUS = 'REVEALED'
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

  def revealed?
    self.status == REVEALED_STATUS
  end

  def queued?
    self.status == QUEUED_STATUS
  end

  def active?
    self.status == ACTIVE_STATUS
  end

  def completed?
    self.status == COMPLETED_STATUS
  end

  def tick!
    if queued?
      queued_tick!

    elsif active?
      active_tick!

    elsif revealed?
      revealed_tick!
    else
      raise "This should not happen, no tick message should be sent to a completed verse"
    end
  end

  def queued_tick!
    set_active!
    VerseTickJob.set(wait: (1).seconds).perform_later(self.uuid)
  end

  def active_tick!
    if next_hidden_word
      next_hidden_word.visible! 
      VerseTickJob.set(wait: (1).seconds).perform_later(self.uuid)
    else
      set_revealed!
      VerseTickJob.set(wait: (8).seconds).perform_later(self.uuid)
    end
  end

  def split_words!
    verse_text.to_s.split(' ').each do |word|
      verse_words.create(word_text: word, visible: false)
    end
  end

  def revealed_tick!
    set_complete!
    GameRoundTickJob.set(wait: 3.seconds).perform_later(game_round.uuid)
  end

  def next_hidden_word
    verse_words.hidden.random.sample
  end

  def set_active!
    update_attribute(:status, ACTIVE_STATUS) unless status == ACTIVE_STATUS
  end

  def set_complete!
    update_attribute(:status, COMPLETED_STATUS)
  end

  def set_revealed!
    update_attribute(:status, REVEALED_STATUS)
  end

  def add_answers!
    AddsBookAnswers.new(self).add_answers
    AddsChapterAnswers.new(self).add_answers
    AddsVerseAnswers.new(self).add_answers
  end

  def random_from_fixture
    # this will go away once the lsm api stuff works
    AddsVerseInfoFromFixture.new(self).fill_in_verse_with_random_info
  end
end
