class BookGuessesController < ApplicationController
  def create
    @verse = Verse.find_by_id(params[:verse_id])
    @book_answer = @verse.book_answers.find_by_id(params[:book_answer_id])
    # do something with the points?
  end
end
