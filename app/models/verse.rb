class Verse < ApplicationRecord
  belongs_to :game_round, optional: true
  has_one :game_session, through: :game_round
  has_many :verse_words, dependent: :destroy
  has_many :book_answers, dependent: :destroy
  has_many :chapter_answers, dependent: :destroy
  # this should be changed to verse_number_answers
  has_many :verse_answers, dependent: :destroy

  delegate :score_board, to: :game_session # weird feeling

  QUEUED_STATUS = 'QUEUED'
  ACTIVE_STATUS = 'ACTIVE'
  COMPLETED_STATUS = 'COMPLETED'
  REVEALED_STATUS = 'REVEALED'
  STATUSES = [QUEUED_STATUS, ACTIVE_STATUS, COMPLETED_STATUS]

  def printed_reference
    # so ugly
    BuildsBookNumberKeyedHash.new.hash[book_number]['book_name'] + " " + chapter_number.to_s + ":" + verse_number.to_s
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
    VerseTickJob.set(wait: (2).seconds).perform_later(self.uuid)
  end

  def active_tick!
    if next_hidden_word
      next_hidden_word.visible! 
      VerseTickJob.set(wait: (1).seconds).perform_later(self.uuid)
    else
      VerseTickJob.set(wait: (4).seconds).perform_later(self.uuid)
      set_revealed!
    end
  end

  def split_words!
    verse_text.to_s.split(' ').each do |word|
      verse_words.create(word_text: word, visible: false)
    end
  end

  def revealed_tick!
    GameRoundTickJob.set(wait: 5.seconds).perform_later(game_round.id)
    set_complete!
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
    broadcast_replace_to game_session, target: 'possible-answers', html: self.printed_reference
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
