class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_found
    redirect_to root_path
  end
end
