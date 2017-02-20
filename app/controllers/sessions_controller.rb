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
      handle_login_success
    else
      handle_login_failure
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

    def handle_login_success
      respond_to do |format|
        format.html { redirect_to @redirect_url }
        format.js
      end
    end

    def handle_login_failure
      respond_to do |format|
        format.html { redirect_to posts_path }
        format.js
      end
    end
end
