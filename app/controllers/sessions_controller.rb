class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.create(name: params[:name]) if params[:name].present?

    if user
      session[:user_id] = user.id
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
