class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @user = current_user
      @goal = current_user.goals.build
      @feed_items = current_user.feed
      @status_feed = current_user.statuses
      @status = Status.new
    end
  end

  def help
  end

  def about
    @user = User.new
    @all = User.all
  end

  def contact
  end

  def blog
    
  end
end
