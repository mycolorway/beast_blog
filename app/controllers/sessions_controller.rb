class SessionsController < ApplicationController
  def new
  end

  def create
    @user = Author.authenticate params[:email], params[:password]

    if @user
      log_in @user

      redirect_to root_path
    else
      render new_session_path
    end
  end

  def destroy
  end
end
