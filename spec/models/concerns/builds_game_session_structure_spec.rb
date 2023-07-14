require 'rails_helper'

RSpec.describe BuildsGameSessionStructure do
  describe "#build" do
    it "builds the supporting round and verse structure when given a game_session_id" do
      allow_any_instance_of(LsmVerseRetriever).to receive(:retrieve)
      allow_any_instance_of(LsmVerseRetriever).to receive(:text).and_return("Jesus wept.")
      allow_any_instance_of(LsmVerseRetriever).to receive('valid?').and_return(true)
      game_session = create(:game_session)

      BuildsGameSessionStructure.new(game_session.id).build(num_rounds: 3, num_verses: 30)

      #verify rounds and verses per round
      expect(game_session.game_rounds.size).to eq 3
      expect(game_session.game_rounds.first.verses.size).to eq 10

    end
  end
end
