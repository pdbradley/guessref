require 'rails_helper'

RSpec.describe GameSession, type: :model do
  describe "#tick!" do
    it "increments the tick count" do
      game_session = FactoryBot.create(:game_session, tick: 0)
      create(:game_round, game_session: game_session)
      allow(game_session).to receive('completed?').and_return false

      game_session.tick!

      expect(game_session.tick).to eq 1
    end
    it "markes the game session completed if completed? returns true" do
      game_session = FactoryBot.create(:game_session, tick: 0)
      allow(game_session).to receive('completed?').and_return true

      game_session.tick!

      expect(game_session.reload.completed).to be_truthy
    end
  end

  describe "#next_rounds" do
    it "returns the remaining uncompleted rounds with the active round first" do
      game_session = create(:game_session)
      active_game_round = create(:game_round, game_session: game_session, status: GameRound::ACTIVE_STATUS)
      queued_game_round_1 = create(:game_round, game_session: game_session, status: GameRound::QUEUED_STATUS)
      queued_game_round_2 = create(:game_round, game_session: game_session, status: GameRound::QUEUED_STATUS)
      completed_game_round = create(:game_round, game_session: game_session, status: GameRound::COMPLETED_STATUS)

      expect(game_session.next_rounds).to eq [active_game_round, queued_game_round_1, queued_game_round_2]
    end
  end

  describe "#current_round" do
    it "returns the current active round if present" do
      game_session = create(:game_session)
      active_game_round = create(:game_round, game_session: game_session, status: GameRound::ACTIVE_STATUS)
      queued_game_round = create(:game_round, game_session: game_session, status: GameRound::QUEUED_STATUS)
      completed_game_round = create(:game_round, game_session: game_session, status: GameRound::COMPLETED_STATUS)

      expect(game_session.current_round).to eq active_game_round
    end

    it "returns the first queued round if no active round is prepresent" do
      game_session = create(:game_session)
      queued_game_round_1 = create(:game_round, game_session: game_session, status: GameRound::QUEUED_STATUS)
      queued_game_round_2 = create(:game_round, game_session: game_session, status: GameRound::QUEUED_STATUS)
      completed_game_round = create(:game_round, game_session: game_session, status: GameRound::COMPLETED_STATUS)

      expect(game_session.current_round).to eq queued_game_round_1
    end

    it "returns nil if no active or queued round is present" do
      game_session = create(:game_session)
      completed_game_round = create(:game_round, game_session: game_session, status: GameRound::COMPLETED_STATUS)

      expect(game_session.current_round).to be_nil
    end
  end
end
