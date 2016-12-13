class SessionsController < ApplicationController

  def new
  end

  def create
    auth_user

    if @user
      log_in @user
      redirect_to root_path
    else
      render new_session_path
    end
  end

  def destroy
    log_out
  end

  private

    def auth_user
      if request.env['omniauth.auth'].blank?
        @user = Author.authenticate params[:email], params[:password]
      else
        @user = User.authenticate request.env['omniauth.auth']
      end
    end
end
