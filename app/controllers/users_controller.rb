class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to result_path(id: @user.id)
    else
      flash[:error] = "loleno"
      redirect_to "/"
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
