require 'rails_helper'

RSpec.describe GameSession, type: :model do
  describe "#tick!" do
    it "increments the tick count" do
      game_session = FactoryBot.create(:game_session, tick: 0)

      game_session.tick!

      expect(game_session.tick).to eq 1
    end
  end
end
