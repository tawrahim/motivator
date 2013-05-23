class UsersController < ApplicationController
  before_filter :signed_in_user, 
                only: [:index, :edit, :update, :destroy, :following, :followers]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy
  before_filter :redirect_to_profile, only: :new

  def index
    @user = User.find_by_remember_token(cookies[:remember_token])
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

  def edit
    @user = User.find(params[:id]) 
  end

  def update
    @user = User.find(params[:id]) 
    if @user.update_attributes(params[:user])
      sign_in @user
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render :edit
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed"
    redirect_to users_path
  end

  def following
    @title = "Following" 
    @user = User.find(params[:id])
    @users = @user.followed_users
    render 'show_follow'
  end

  def followers 
    @title = "Followers" 
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end

  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to root_path unless current_user?(@user) 
    end

    def admin_user
      redirect_to root_path unless current_user.admin?
      
    end

    def redirect_to_profile
      @user = User.find_by_remember_token(cookies[:remember_token]) unless !cookies[:remember_token]
      redirect_to @user if defined?(@user)
    end
end
