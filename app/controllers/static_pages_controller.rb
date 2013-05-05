class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
    @user = User.new
    @all = User.all
  end

  def contact
  end
end
