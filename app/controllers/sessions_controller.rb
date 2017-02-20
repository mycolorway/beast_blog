class SessionsController < ApplicationController

  def new
    build_session
    render layout: 'center'
  end

  def create
    build_session
    if @session.save
      log_in @session.user
      @redirect_url = session[:return_to] || posts_path
    else
      render :new
    end
  end

  def destroy
    log_out
  end

  private

    def build_session
      @session ||= Session.new(omniauth: request.env['omniauth.auth'])
      @session.attributes = session_params
    end

    def session_params
      params.fetch(:session, {}).permit [:email, :password]
    end
end
