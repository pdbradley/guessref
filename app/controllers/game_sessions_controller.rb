class GameSessionsController < ApplicationController

  skip_before_action :authenticate!, only: [:index]

  def index
    @game_sessions = GameSession.recent.active_and_lobby
  end

  def show
    @game_session = GameSession.find params[:id]
    current_user.game_sessions << @game_session unless current_user.game_sessions.include? @game_session
    render layout: 'no_nav'
  end

  def new
  end

  def create
    game_session = GameSession.new(name: params[:name], status: GameSession::LOBBY_STATUS)
    if game_session.valid?
      game_session.save
      BuildsGameSessionStructure.new(game_session.id).build(num_rounds: 1, num_verses: 3)
      game_session.users << current_user
      redirect_to game_session_path(game_session)
    else
      render :new
    end
  end

  def start
    game_session = GameSession.find params[:id]
    if game_session
      game_session.tick! 
      redirect_to game_session_path(game_session)
    end
  end
end
