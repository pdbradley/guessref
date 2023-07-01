require 'rails_helper'

RSpec.describe Verse, type: :model do
  #todo add scope tests for verse types

  describe "#printed_reference" do
    it "prints out the reference in human readable form" do
      verse = create(:verse, book_number: 1, chapter_number: 1, verse_number: 1)

      expect(verse.printed_reference).to eq "Genesis 1:1"
    end
  end
  describe "tick!" do
    context "when the verse is QUEUED" do
      it "sets the verse to ACTIVE and schedules a verse tick job" do
        allow(VerseTickJob).to receive_message_chain(:set, :perform_later)
        verse = create(:verse, status: Verse::QUEUED_STATUS)

        verse.tick!

        expect(verse.status).to eq Verse::ACTIVE_STATUS
        expect(VerseTickJob).to have_received(:set)
      end
    end
    context "when the verse is ACTIVE" do
      it "makes a verse_word visible when one or more are not visible and schedules a verse tick job" do
        allow(VerseTickJob).to receive_message_chain(:set, :perform_later)
        verse = verse_with_status(Verse::ACTIVE_STATUS)
        create(:verse_word, visible: false, verse: verse)
        create(:verse_word, visible: false, verse: verse)

        verse.tick!

        expect(verse.verse_words.visible.count).to eq 1
        expect(verse.verse_words.invisible.count).to eq 1
        expect(VerseTickJob).to have_received(:set)
      end
      it "sets the verse to REVEALED when there are no more invisible verses and schedules a verse tick job" do
        allow(VerseTickJob).to receive_message_chain(:set, :perform_later)
        verse = verse_with_status(Verse::ACTIVE_STATUS)
        create(:verse_word, visible: true, verse: verse)
        create(:verse_word, visible: true, verse: verse)

        verse.tick!

        expect(verse.status).to eq Verse::REVEALED_STATUS
        expect(VerseTickJob).to have_received(:set)
      end
    end
    context "when the verse is REVEALED" do
      it "sets the status to complete and schedules a game_round tick job" do
        allow(GameRoundTickJob).to receive_message_chain(:set, :perform_later)
        verse = verse_with_status(Verse::REVEALED_STATUS)

        verse.tick!

        expect(verse.status).to eq Verse::COMPLETED_STATUS
        expect(GameRoundTickJob).to have_received(:set)
      end
    end
  end

  describe "#random_from_fixture" do
    it "populates the verse attributes and verse_words from a fixture file" do
      game_round = create(:game_round, game_session: create(:game_session))
      verse = create(:verse, game_round: game_round)

      verse.random_from_fixture

      expect(verse.verse_words).not_to be_empty
    end
  end

  describe "#split_words" do
    it "takes the verse_text and splits it and creates the verse_words associated" do
      game_round = create(:game_round, game_session: create(:game_session))
      verse = create(:verse, game_round: game_round, verse_text: "Jesus wept.")

      verse.split_words!

      expect(verse.verse_words.first.word_text).to eq 'Jesus'
      expect(verse.verse_words.last.word_text).to eq 'wept.'
    end
  end

  def verse_with_status(status = Verse::ACTIVE_STATUS)
    game_round = create(:game_round, game_session: create(:game_session))
    verse = create(:verse, game_round: game_round, status: status)
  end

end
