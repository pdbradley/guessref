require 'rails_helper'

RSpec.describe GameRound, type: :model do
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

    it "returns the first queued round if no active round is prepresent" do
      game_session = create(:game_session)
      game_round = create(:game_round, game_session: game_session, status: GameRound::ACTIVE_STATUS)
      queued_verse_1 = create(:verse, game_round: game_round, status: Verse::QUEUED_STATUS)
      queued_verse_2 = create(:verse, game_round: game_round, status: Verse::QUEUED_STATUS)
      completed_verse = create(:verse, game_round: game_round, status: Verse::COMPLETED_STATUS)

      expect(game_round.current_verse).to eq queued_verse_1
    end

    it "returns nil if no active or queued round is present" do
      game_session = create(:game_session)
      game_round = create(:game_round, game_session: game_session, status: GameRound::ACTIVE_STATUS)
      completed_verse = create(:verse, game_round: game_round, status: Verse::COMPLETED_STATUS)

      expect(game_round.current_verse).to be_nil
    end
  end

end
