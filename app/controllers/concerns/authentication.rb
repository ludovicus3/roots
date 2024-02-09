module Authentication
  extend ActiveSupport::Concern

  def authenticate
    return true if session[:user_id]

    redirect_to login_path
  end

  def require_login
    authenticate
  end
end