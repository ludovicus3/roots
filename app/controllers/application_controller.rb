class ApplicationController < ActionController::Base
  include Authentication
  include Session

  before_action :require_login
  before_action :session_expiry, :update_activity_time
end
