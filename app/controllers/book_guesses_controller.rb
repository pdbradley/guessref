class BookGuessesController < ApplicationController
  def create

    user_answer = UserAnswer.new(
      user: current_user,
      verse: verse,
      game_round: verse&.game_round,
      game_session: verse&.game_session,
      book_answer: book_answer,
      answer_point_value: book_answer&.point_value
    )
    if user_answer.valid?
      user_answer.save
    else
      head :bad_request
    end
  end

  def verse
    @verse ||= Verse.find_by_id(params[:verse_id])
  end

  def book_answer
    @book_answer ||= verse.book_answers.find_by_id(params[:book_answer_id])
  end

  def correct?
    book_answer.correct
  end
end
