class UserGameSessionsController < ApplicationController

  def destroy
    game_session ||= GameSession.find params[:id]
    UserGameSession.where(user: current_user, game_session: game_session).destroy_all
    redirect_to game_sessions_path
  end

end
