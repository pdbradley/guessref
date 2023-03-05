require 'rails_helper'

RSpec.describe GameRound, type: :model do
  describe "#tick!" do
    context "when QUEUED" do
      it "sets the game round to COMPLETE when there are no active or queued verses" do
        game_round = create(:game_round, status:  GameRound::QUEUED_STATUS, game_session: create(:game_session))

        game_round.tick!

        expect(game_round.reload.status).to eq GameRound::COMPLETED_STATUS
      end
      it "sets the game round to ACTIVE when there are active verses" do
        game_round = create(:game_round, status:  GameRound::QUEUED_STATUS, game_session: create(:game_session))
        active_verse = create(:verse, game_round: game_round, status: Verse::ACTIVE_STATUS)

        game_round.tick!

        expect(game_round.reload.status).to eq GameRound::ACTIVE_STATUS
      end
      it "sends tick! to the current_verse if it exists" do
        game_round = create(:game_round, status:  GameRound::QUEUED_STATUS, game_session: create(:game_session))
        current_verse = double(:verse, verse_words: [])
        allow(current_verse).to receive(:tick!)
        allow(game_round).to receive(:current_verse).and_return(current_verse)
        allow(Broadcast::GameRound).to receive(:update) # dont need broadcasting!

        game_round.tick!

        expect(current_verse).to have_received(:tick!)
      end
    end
    context "when ACTIVE" do
      it "sets the game round to COMPLETE when there are no active or queued verses" do
        game_round = create(:game_round, status:  GameRound::ACTIVE_STATUS)

        game_round.tick!

        expect(game_round.reload.status).to eq GameRound::COMPLETED_STATUS
      end
      it "sends tick! to the current_verse if it exists" do
        game_round = create(:game_round, status:  GameRound::ACTIVE_STATUS, game_session: create(:game_session))
        current_verse = double(:verse, verse_words: [])
        allow(current_verse).to receive(:tick!)
        allow(game_round).to receive(:current_verse).and_return(current_verse)
        allow(Broadcast::GameRound).to receive(:update) # dont need broadcasting!

        game_round.tick!

        expect(current_verse).to have_received(:tick!)
      end
    end
  end







  describe "completed?" do
    it "returns true if the status is completed" do
      completed_game_round = create(:game_round, status:  GameRound::COMPLETED_STATUS, game_session: create(:game_session))
      queued_game_round = create(:game_round, status:  GameRound::QUEUED_STATUS, game_session: create(:game_session))
      active_game_round = create(:game_round, status:  GameRound::ACTIVE_STATUS, game_session: create(:game_session))

      expect(completed_game_round.completed?).to eq true
      expect(queued_game_round.completed?).to eq false
      expect(active_game_round.completed?).to eq false
    end
  end

  describe "#next_verses" do
    it "returns the remaining uncompleted verses with the active verse first" do
      game_session = create(:game_session)
      game_round = create(:game_round, game_session: game_session, status: GameRound::ACTIVE_STATUS)
      active_verse = create(:verse, game_round: game_round, status: Verse::ACTIVE_STATUS)
      queued_verse = create(:verse, game_round: game_round, status: Verse::QUEUED_STATUS)
      completed_verse = create(:verse, game_round: game_round, status: Verse::COMPLETED_STATUS)

      expect(game_round.next_verses).to eq [active_verse, queued_verse]
    end
  end

  describe "#current_verse" do
    it "returns the current active verse if present" do
      game_session = create(:game_session)
      game_round = create(:game_round, game_session: game_session, status: GameRound::ACTIVE_STATUS)
      active_verse = create(:verse, game_round: game_round, status: Verse::ACTIVE_STATUS)
      queued_verse = create(:verse, game_round: game_round, status: Verse::QUEUED_STATUS)
      completed_verse = create(:verse, game_round: game_round, status: Verse::COMPLETED_STATUS)

      expect(game_round.current_verse).to eq active_verse
    end

    it "returns the first queued verse if no active verse is prepresent" do
      game_session = create(:game_session)
      game_round = create(:game_round, game_session: game_session, status: GameRound::ACTIVE_STATUS)
      queued_verse_1 = create(:verse, game_round: game_round, status: Verse::QUEUED_STATUS)
      queued_verse_2 = create(:verse, game_round: game_round, status: Verse::QUEUED_STATUS)
      completed_verse = create(:verse, game_round: game_round, status: Verse::COMPLETED_STATUS)

      expect(game_round.current_verse).to eq queued_verse_1
    end

    it "returns nil if no active or queued verse is present" do
      game_session = create(:game_session)
      game_round = create(:game_round, game_session: game_session, status: GameRound::ACTIVE_STATUS)
      completed_verse = create(:verse, game_round: game_round, status: Verse::COMPLETED_STATUS)

      expect(game_round.current_verse).to be_nil
    end
  end

end
