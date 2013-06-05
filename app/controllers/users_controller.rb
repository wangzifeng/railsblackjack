class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index   
  end

  def show
    #raise params.inspect
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:welcome] = "Welcome to the site!"
      redirect_to @user
    else
      render "new"
    end
  end
end
