require 'rails_helper'

RSpec.describe Verse, type: :model do
  #todo add scope tests for verse types

  describe "tick!" do
    it "will set one of the versewords to visible each tick" do
      game_round = create(:game_round, game_session: create(:game_session))
      verse = create(:verse, game_round: game_round)
      create(:verse_word, visible: false, verse: verse)
      create(:verse_word, visible: false, verse: verse)
      create(:verse_word, visible: false, verse: verse)

      verse.tick!
      expect(verse.verse_words.visible.size).to eq 1
      expect(verse.verse_words.invisible.size).to eq 2
      verse.tick!
      expect(verse.verse_words.visible.size).to eq 2
      expect(verse.verse_words.invisible.size).to eq 1
      verse.tick!
      expect(verse.verse_words.visible.size).to eq 3
      expect(verse.verse_words.invisible.size).to eq 0
    end
    it "sets the verse status to COMPLETED if asked to tick when there are no hidden verses" do
      game_round = create(:game_round, game_session: create(:game_session))
      verse = create(:verse, game_round: game_round)

      verse.tick!

      expect(verse.status).to eq Verse::COMPLETED_STATUS
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
end
