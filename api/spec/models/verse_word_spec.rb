require 'rails_helper'

RSpec.describe VerseWord, type: :model do
  describe "scopes" do
    describe ".hidden, .visible" do
      it "shows verse words where visible is false" do
        game_round = create(:game_round, game_session: create(:game_session))
        verse = create(:verse, game_round: game_round)

        hidden = create(:verse_word, visible: false, verse: verse)
        visible = create(:verse_word, visible: true, verse: verse)

        expect(verse.verse_words.hidden).to eq [hidden]
        expect(verse.verse_words.visible).to eq [visible]
      end
    end
  end
end
