require 'rails_helper'

RSpec.describe ConvertsUserAnswersIntoScoreboardHash do
  describe "#user_scores" do
    describe "given a collection of user_answers related to a game_session" do
      it "returns a hash with key username value total score" do
        game_session = create(:game_session)
        game_round = create(:game_round, game_session: game_session)
        verse = create(:verse, game_round: game_round)

        phil = create(:user, name: 'Phil')
        waseem = create(:user, name: 'Waseem')
        hope = create(:user, name: 'Hope')
        create(:user_answer, answer_point_value: 1, verse: verse, game_round: game_round, game_session: game_session, user: phil)
        create(:user_answer, answer_point_value: 2, verse: verse, game_round: game_round, game_session: game_session, user: phil)
        create(:user_answer, answer_point_value: 3, verse: verse, game_round: game_round, game_session: game_session, user: phil)
        create(:user_answer, answer_point_value: 4, verse: verse, game_round: game_round, game_session: game_session, user: waseem)
        create(:user_answer, answer_point_value: 5, verse: verse, game_round: game_round, game_session: game_session, user: hope)

        result = ConvertsUserAnswersIntoScoreboardHash.new(game_session.user_answers).scoreboard_hash

        expect(result['Phil']).to eq 6
        expect(result['Waseem']).to eq 4
        expect(result['Hope']).to eq 5
      end
    end
  end
end
