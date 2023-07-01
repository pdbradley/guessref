# frozen_string_literal: true

class GameSessionScoreboardComponent < ViewComponent::Base
  
  def initialize(score_board)
    @score_board = score_board
  end

  def names_and_scores
    @score_board.all_names_and_scores
  end

  def render?
    @score_board
  end

end
