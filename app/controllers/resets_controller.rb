class ResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:resets][:email])
    if user
      user.send_password_reset
      redirect_to root_path
      flash[:success] = "An email has been sent to you for password reset"
    else
      flash.now[:error] = "Wrong email provided"
      render 'new'
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to forgot_path, :alert => "Password reset has expired"
    elsif @user.update_attributes(params[:user])
      redirect_to root_path, :notice => "Password has been reset"
    else
      render :edit
    end
  end
end
