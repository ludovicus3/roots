module Session
  extend ActiveSupport::Concern

  def session_expiry
    # return if ignore_api_request?
    if session[:expires_at].blank? || (Time.at(session[:expires_at]).utc - Time.now.utc).to_i < 0
      session[:original_uri] = request.fullpath
      expire_session
    end
  rescue => error
    expire_session
  end

  def backup_session_content(keys = [:original_uri])
    save_items = session.to_hash.slice(*keys.map(&:to_s)).symbolize_keys
    yield if block_given?
    session.update(save_items)
  end

  def update_activity_time
    set_activity_time
  end

  def set_activity_time
    session[:expires_at] = 10.minutes.from_now.to_i
  end

  def expire_session
    backup_session_content { reset_session }
    redirect_to login_path
  end
end