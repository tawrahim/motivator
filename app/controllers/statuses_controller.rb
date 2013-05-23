class StatusesController < ApplicationController
  def create
    @status = Status.new
    @feed_items = current_user.feed
    @goal = current_user.goals.build(params[:goal])
    @goal_id = params[:goal_id]
    render 'static_pages/home'
  end

  def delete
  end
end
