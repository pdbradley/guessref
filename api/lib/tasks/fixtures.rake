# resetting data in dev for demos
namespace :dev do
  desc 'Clear DB'
  task clear_db: :environment do
    puts 'clearing...'
    VerseWord.delete_all
    BookAnswer.delete_all
    ChapterAnswer.delete_all
    VerseAnswer.delete_all
    Verse.delete_all
    GameRound.delete_all
    GameSession.delete_all
  end

  desc 'Set up a small game'
  task small_game: [:environment, :clear_db] do
    puts "creating one verse game"
    game_session = FactoryBot.create(:game_session)
    game_rounds = FactoryBot.create_list(:game_round, 1, game_session: game_session, status: GameRound::ACTIVE_STATUS)

    game_rounds.each do |game_round|
      verse = FactoryBot.create(:verse, :with_verse_words, game_round: game_round)
    end
  end
end
