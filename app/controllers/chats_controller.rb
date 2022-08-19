class ChatsController < ApplicationController

  def create
    @game_session = GameSession.find params[:game_session_id]
    @game_session.chat_messages.create(user: current_user, message: params[:message])
  end

end
