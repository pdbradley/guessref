class ApplicationController < ActionController::Base

  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id session[:user_id] 
    end
  end

end
