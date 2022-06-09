class GamesController < ApplicationController

  def index
    @games = GameSession.all
  end

  def new

  end

  def create
    game_session = GameSession.create(creator_uuid: params[:creator_uuid], name: params[:name], status: GameSession::LOBBY_STATUS)

    BuildsGameSessionStructure.new(game_session.id).build(num_rounds: 1, num_verses: 10)
    redirect_to games_path
  end

  def start
    game_session = GameSession.find_by(uuid: params[:uuid])

    if game_session
      game_session.tick!
      render json: :success
    else
      render error: { error: 'Unable to start game session' }
    end
  end
end
