class ConvertsUserAnswersIntoScoreboardHash

  def initialize(user_answers)
    @user_answers = user_answers
  end

  def scoreboard_hash
    @user_answers.joins(:user).group('users.name').sum(:answer_point_value)
  end

end
