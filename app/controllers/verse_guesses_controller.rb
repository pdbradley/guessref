class VerseGuessesController < ApplicationController
  def create
    @verse = Verse.find_by_id(params[:verse_id])
    @verse_answer = @verse.verse_answers.find_by_id(params[:verse_answer_id])
  end
end
