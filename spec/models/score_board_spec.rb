require 'rails_helper'

RSpec.describe ScoreBoard, type: :model do
  describe '#set_score' do
    it "adds a single score to the score board for a user" do
      score_params = {user_id: 1, name: 'Phil', points: 10}
      score_board.set_score(score_params)

      score_params.delete(:user_id)
      expect(score_board.scores['1']).
        to eq (score_params.transform_keys(&:to_s))
    end
    it "adds an array of scores to the score board for users" do
      score_board.set_score [
        {user_id: 1, name: 'Phil', points: 10},
        {user_id: 2, name: 'Jim', points: 20}
      ]

      expect(score_board.scores['1']).
        to eq ({name: 'Phil', points: 10}.transform_keys(&:to_s))
      expect(score_board.scores['2']).
        to eq ({name: 'Jim', points: 20}.transform_keys(&:to_s))
    end
  end

  describe '#add_to_score' do
    it 'creates a score if none exists' do
      score_params = {user_id: 1, name: 'Phil', points: 10}
      score_board.add_to_score(**score_params)

      score_params.delete(:user_id)
      expect(score_board.scores['1']).
        to eq (score_params.transform_keys(&:to_s))
    end
    it 'adds to a score if one exists' do
      score_params = {user_id: 1, name: 'Phil', points: 10}
      score_board.set_score(**score_params)
      score_board.add_to_score(**{user_id: 1, name: 'Phil', points: 15})

      expect(score_board.scores['1']['points']).
        to eq (25) #10 + 10
    end
  end

  describe "#all_scores" do
    it "returns all scores sorted desc" do
      score_board.add_to_score(**{user_id: 1, name: 'Low', points: 10})
      score_board.add_to_score(**{user_id: 2, name: 'High', points: 30})
      score_board.add_to_score(**{user_id: 3, name: 'Middle', points: 20})

      expect(score_board.all_names_and_scores).to eq [
        {'name' => 'High', 'points' => 30},
        {'name' => 'Middle', 'points' => 20},
        {'name' => 'Low', 'points' => 10}
      ]
    end
  end

  def score_board
    @sb ||= create(:score_board)
  end

end
