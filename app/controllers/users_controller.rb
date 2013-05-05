class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id]) 
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "welcome to the motivator"
      redirect_to user_path(@user)
      UserMailer.welcome_email(@user).deliver
    else
      render 'new' 
    end
  end
end
