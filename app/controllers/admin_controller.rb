class AdminController < ApplicationController
  def logout
    session[:is_admin] = false
    redirect_to admin_path
  end

  def index
    if params[:password]
      authenticate
    else
      if session[:is_admin] == true
        @logged_in = true
        @users = User.all(:order => "created_at DESC")
      else
        @logged_in = false
      end
    end
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
