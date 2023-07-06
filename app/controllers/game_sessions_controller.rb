class GameSessionsController < ApplicationController

  skip_before_action :authenticate!, only: [:index]

  def index
    @game_sessions = GameSession.recent.order(:created_at).reverse_order
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
      game_session.users << current_user
      game_session.create_score_board!

      BuildsGameSessionStructureJob.perform_later(game_session.id)

      redirect_to game_session_path(game_session)
    else
      render :new
    end
  end

  def reset
    @game_session = GameSession.find params[:id]
    @game_session.update!(status: GameSession::LOBBY_STATUS)
    @game_session.score_board.reset_scores
    @game_session.game_rounds.each {|gr| gr.destroy}
    BuildsGameSessionStructureJob.perform_later(@game_session.id)
    redirect_to game_session_path(@game_session)
  end
    


  def start
    game_session = GameSession.find params[:id]
    if game_session && game_session.retrieved?
      game_session.tick! 
      redirect_to game_session_path(game_session)
    end
  end
end
