class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
    auth = request.env["omniauth.auth"]
    @more = auth["info"]["email"] if auth
  end

  def show
    @user = User.find(params[:id]) 
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "welcome to the motivator"
      redirect_to user_path(@user)
      UserMailer.welcome_email(@user).deliver
    else
      render 'new' 
    end
  end
end
