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
  # 0.  when given a game session id
  # 1.  pull X verses from the NT 520 verse list at random (default 45)
 
  NUM_ROUNDS = 3
  NUM_VERSES = 5
  
  def initialize(game_session_id)
    @game_session = GameSession.find(game_session_id)
  end

  def build(num_rounds: NUM_ROUNDS, num_verses: NUM_VERSES)
    verses_with_data(num_verses).in_groups_of(num_verses / num_rounds).each do |verses_for_one_round|
      game_round = @game_session.game_rounds.create
      verses_for_one_round.compact.each do |verse_data|
        verse = game_round.verses.create(
          book_number: verse_data.book_number,
          chapter_number: verse_data.chapter_number,
          verse_number: verse_data.verse_number,
          verse_text: verse_data.text)
        verse.split_words!
        verse.add_answers!
      end
    end
  end

  private

  def verses_with_data(num)
    verse_pool = PullsRandomVerseReferences.new(num).pull
    result = verse_pool.map{|row| UnpacksReferenceRowIntoVerseData.new(row)}
    result
  end
end
