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

  desc 'Set up one verse game'
  task one_verse_game: [:environment, :clear_db] do
    puts "creating one verse game"
    game_session = FactoryBot.create(:game_session)
    game_round = FactoryBot.create(:game_round, game_session: game_session, status: GameRound::ACTIVE_STATUS)
    verse = FactoryBot.create(:verse, game_round: game_round)
    FactoryBot.create(:verse_word, word_text: "Jesus", verse: verse)
    FactoryBot.create(:verse_word, word_text: "wept.", verse: verse)
  end

end
