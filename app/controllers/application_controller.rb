class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login
  before_action :set_time

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  # def ctime
  #   @time = Time.zone = 'Central Time (US & Canada)'
  # end
  # helper_method :ctime
  private
  def set_time
    Time.zone = 'Central Time (US & Canada)'
  end
  def require_login
  	if session[:user_id] == nil
  		redirect_to "/"
  	end
  end
end
