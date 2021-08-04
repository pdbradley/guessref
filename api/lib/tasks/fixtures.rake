# resetting data in dev for demos
namespace :dev do
  desc 'Clear DB'
  task clear_db: :environment do
    puts 'clearing...'
    VerseWord.delete_all
    Verse.delete_all
    GameRound.delete_all
    GameSession.delete_all
  end

  desc 'Set up a small game'
  task small_game: [:environment, :clear_db] do
    puts "creating one verse game"
    game_session = FactoryBot.create(:game_session)
    game_rounds = FactoryBot.create_list(:game_round, 3, game_session: game_session, status: GameRound::ACTIVE_STATUS)

    game_rounds.each do |game_round|
      # verse one
      verse = FactoryBot.create(:verse, game_round: game_round)
      verse_words = "John testified concerning Him and cried out, saying, This was He of whom I said, He who is coming after me has become ahead of me, because He was before me.".split(' ')
      verse_words.each do |word|
        FactoryBot.create(:verse_word, word_text: word, verse: verse)
      end
      
      # verse two
      verse = FactoryBot.create(:verse, game_round: game_round)
      verse_words = "And I did not know Him, but He who sent me to baptize in water, He said to me, He upon whom you see the Spirit descending and abiding upon Him, this is He who baptizes in the Holy Spirit.".split(' ')
      verse_words.each do |word|
        FactoryBot.create(:verse_word, word_text: word, verse: verse)
      end
    end
  end
end
