class ChapterGuessesController < ApplicationController
  def create
    @verse = Verse.find_by_id(params[:verse_id])
    @chapter_answer = @verse.chapter_answers.find_by_id(params[:chapter_answer_id])
    # do something with the points?
  end
end
