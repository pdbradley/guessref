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

  desc 'Set up a game'
  task one_game: [:environment] do
    game_session = FactoryBot.create(:game_session, name: "Somebody's verse game" )
    game_rounds = FactoryBot.create_list(:game_round, 2, game_session: game_session, status: GameRound::ACTIVE_STATUS)

    game_rounds.each do |game_round|
      5.times do
        verse = FactoryBot.create(:verse, game_round: game_round)
        verse.random_from_fixture
      end
    end
  end

  desc 'Set up many games'
  task many_games: [:environment] do
    Rake::Task["dev:clear_db"].invoke
    puts "many games"
    1.times do 
      Rake::Task["dev:one_game"].reenable
      Rake::Task["dev:one_game"].invoke
    end
  end
end
