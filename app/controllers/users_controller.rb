class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to result_path(id: @user.id, name: @user.name.parameterize)
    else
      redirect_to root_path
    end
  end

  def show
    @user = User.find(params[:id])
    @big_trigram = @user.trigram =~ /.*(M|W).*/i
  end
end
