class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_or_create_by_name(params[:user])
    if @user.save
      redirect_to result_path(id: @user.id, name: @user.name.parameterize)
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
    redirect_to root_path if params[:name] != @user.name.parameterize
    @user.increment_hits!
  end

end
