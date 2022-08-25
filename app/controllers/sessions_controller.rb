class SessionsController < ApplicationController

  skip_before_action :authenticate!, only: [:new, :create]

  def new
  end

  def create
    user = User.create(name: params[:name]) if params[:name].present?

    if user
      session[:user_id] = user.id
      redirect_after_login
    else
      render :new
    end
  end

  def destroy
    current_user.user_game_sessions.destroy_all

    session[:user_id] = nil
    redirect_to root_path
  end

  def redirect_after_login
    original_target = session[:original_target]
    if original_target
      session[:original_target] = nil
      redirect_to original_target
    else
      redirect_to root_url
    end
  end
end
