class GameSessionsController < ApplicationController

  def index
    @game_sessions = GameSession.active_and_lobby
  end

  def show
    @game_session = GameSession.find params[:id]
  end

  def staging
    @game_session = GameSession.find params[:id]
  end

  def new
  end

  def create
    game_session = GameSession.new(name: params[:name], status: GameSession::LOBBY_STATUS)
    if game_session.valid?
      game_session.save
      BuildsGameSessionStructure.new(game_session.id).build(num_rounds: 1, num_verses: 3)
      redirect_to game_session_path(game_session)
    else
      render :new
    end
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
