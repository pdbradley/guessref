class VerseGuessesController < ApplicationController
  def create
    @verse = Verse.find_by_id(params[:verse_id])
  end
end
