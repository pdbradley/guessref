class UserGameSessionsController < ApplicationController

  def create
    game_session = GameSession.find params[:game_session_id]
    current_user.game_sessions << game_session
    redirect_to game_session_path(id: params[:game_session_id])
  end

  def destroy
    game_session ||= GameSession.find params[:id]
    UserGameSession.where(user: current_user, game_session: game_session).destroy_all
    redirect_to game_sessions_path
  end

end
