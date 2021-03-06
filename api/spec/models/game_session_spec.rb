require 'rails_helper'

RSpec.describe GameSession, type: :model do
  describe "Multi Tick Scenarios" do
    # this test is not really a test more a way to visualize game state through the system for me
    it "handles multiple ticks" do
      # not sure where to put this but here it sits for now
      game_session = FactoryBot.create(:game_session, tick: 0)
      game_round = create(:game_round, game_session: game_session)
      verse = create(:verse, game_round: game_round)
      verse_word_1 = create(:verse_word, verse: verse, word_text: "Jesus", visible: false) 
      verse_word_2 = create(:verse_word, verse: verse, word_text: "wept.", visible: false) 

      expect(game_session.status).to eq GameSession::LOBBY_STATUS

      50.times do 
        game_session.tick!
      end



      # expect(verse_word_1.reload.visible).to be_truthy
      # expect(verse_word_2.reload.visible).to be_falsey
      # expect(verse.completed?).to be_falsey
      # expect(game_round.completed?).to be_falsey
      #
      # game_session.tick!
      #
      # expect(verse_word_1.reload.visible).to be_truthy
      # expect(verse_word_2.reload.visible).to be_truthy
      # expect(game_round.completed?).to be_falsey
      #
      # game_session.tick!
      #
      # expect(verse.reload.revealed?).to be_truthy
      # expect(game_round.completed?).to be_falsey
      #
      # game_session.tick!
      #
      # expect(game_round.reload.completed?).to be_truthy
      #
      # game_session.tick!
      #
      # expect(game_session.reload.completed?).to be_truthy
      #
      # game_session.tick!
      # game_session.tick!
      # game_session.tick!

    end

  end




  describe "#tick!" do
  end

  describe "#remaining_rounds" do
    it "returns the remaining uncompleted rounds with the active round first" do
      game_session = create(:game_session)
      active_game_round = create(:game_round, game_session: game_session, status: GameRound::ACTIVE_STATUS)
      queued_game_round_1 = create(:game_round, game_session: game_session, status: GameRound::QUEUED_STATUS)
      queued_game_round_2 = create(:game_round, game_session: game_session, status: GameRound::QUEUED_STATUS)
      completed_game_round = create(:game_round, game_session: game_session, status: GameRound::COMPLETED_STATUS)

      expect(game_session.remaining_rounds).to eq [active_game_round, queued_game_round_1, queued_game_round_2]
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
