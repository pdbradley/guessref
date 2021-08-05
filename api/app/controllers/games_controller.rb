class GamesController < ApplicationController

  def create
    game_session = GameSession.create(creator_uuid: params[:creator_uuid])

    if game_session.persisted?
      render json: game_session
    else
      render error: { error: 'Unable to create game session' }
    end
  end

  def start
    game_session = GameSession.find_by(uuid: params[:uuid])

    if game_session
      game_session.start!
      render :success
    else
      render error: { error: 'Unable to start game session' }
    end
  end
end
