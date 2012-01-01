class AdminController < ApplicationController
  before_filter :check_session, :except => [:login, :logout]

  def logout
    session[:is_admin] = false
    redirect_to admin_path
  end

  def login
    authenticate if params[:password]
  end

  def index
    @users = User.all(:order => "created_at DESC")
  end

  protected

  def authenticate
    if SHA1_PASSWORD == Digest::SHA1.hexdigest(params[:password])
      session[:is_admin] = true
      redirect_to admin_path
    else
      session[:is_admin] = false
      redirect_to admin_path(:error => "Invalid Password")
    end
  end
end
