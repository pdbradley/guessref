class ApplicationController < ActionController::Base

  before_action :authenticate!

  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id session[:user_id] 
    end
  end

  def authenticate!
    unless current_user
      session[:original_target] = request.url
      redirect_to sign_in_path 
    end
  end

end
