class BuildsGameSessionStructure

  # a game session has rounds and verses in each round.
  #
  # It is hard to figure out where / how to actually fill in the blanks
  # needed for a game.  You are supplied with a list of references
  # (initially from a file) and that's your pool of available verses to use
  #
  # So we need to validate the references ahead of time if possible, then
  # build rounds with verses attached, and lastly tell each verse to build
  # out its answers, based on its book_number, chapter_number, and verse_number
  #
  # For now, since we don't have yet a programmatic way to find out the max number
  # of chapters in a book, or max number of verses in a chapter, we need the 
  # supplied references to include 
  #
end
