class BookGuessesController < ApplicationController
  def create
    @verse = Verse.find_by_id(params[:verse_id])
    @book_answer = @verse.book_answers.find_by_id(params[:book_answer_id])
    score_board = @verse.score_board

    # do something with the points?
    # I think eventually we want to store each answer
    # but for just hacking this together maybe just send 
    # the user and points to the scoreboard.  which also
    # requires a db query each time ugh I guess it can 
    # be backgrounded!!  but not yet
    score_board.add_to_score(
      user_id: current_user.id,
      name: current_user.name,
      points: @book_answer.point_value
    )
    # user_answer = UserAnswer.new(
    #   user: current_user,
    #   verse: verse,
    #   game_round: verse&.game_round,
    #   game_session: verse&.game_session,
    #   book_answer: book_answer,
    #   answer_point_value: book_answer&.point_value
    # )
    # if user_answer.valid?
    #   user_answer.save
    # else
    #   head :bad_request
    # end
  end

  def correct?
    @book_answer.correct
  end
end
