class SessionsController < ApplicationController
  skip_before_action :require_login, :session_expiry, :update_activity_time
  after_action :update_activity_time, only: :create

  def new
  end

  def create
    if auth = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def destroy
    reset_session
    flash[:notice] = "You have been logged out!"
    redirect_to login_path
  end
end