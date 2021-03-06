class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_found
    redirect_to root_path
  end

  protected
  def check_session
    redirect_to login_path if session[:is_admin] != true
  end

end
