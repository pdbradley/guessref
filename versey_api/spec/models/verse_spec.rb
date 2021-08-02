require 'rails_helper'

RSpec.describe Verse, type: :model do
  describe ".revealed?" do
    it "returns false if any of the words are hidden" do
      game_round = create(:game_round, game_session: create(:game_session))
      verse = create(:verse, game_round: game_round)
      create(:verse_word, visible: false, verse: verse)
      create(:verse_word, visible: true, verse: verse)

      expect(verse.revealed?).to eq false
    end

    it "returns true if all the words are visible" do
      game_round = create(:game_round, game_session: create(:game_session))
      verse = create(:verse, game_round: game_round)
      create(:verse_word, visible: true, verse: verse)
      create(:verse_word, visible: true, verse: verse)

      expect(verse.revealed?).to eq true
    end
  end

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
    it "does nothing if asked to tick when there are no hidden verses" do
      game_round = create(:game_round, game_session: create(:game_session))
      verse = create(:verse, game_round: game_round)

      verse.tick!
    end
  end
end
