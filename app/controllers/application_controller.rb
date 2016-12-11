class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def log_in user
    session[:user_id] = user.id
  end


end
