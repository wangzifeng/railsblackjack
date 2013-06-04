class UsersController < ApplicationController

  def index   
  end

  def show
    #raise params.inspect
    @user = User.find(params[:id])
    @controller = params[:action]
  end

  def new
  end

end
