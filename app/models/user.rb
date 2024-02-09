class User < ApplicationRecord
  def self.find_or_create_by_omniauth(auth)
    find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |user|
      user.email = auth['info']['email']
    end
  end

  def self.current
    @current ||= User.find(session[:user_id]) if session[:user_id]
  end
end