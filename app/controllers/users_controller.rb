class UsersController < ApplicationController
  load_resource only: :show
  before_action :feed_all, only: :show

  def show
    if current_user == @user
      @feed_items = current_user.feed.feed_sort.page(params[:page]).per_page Settings.post.number_show
    else
      @feed_items
    end
  end

  def index
    @users = User.order(:name).page(params[:page]).per_page Settings.user.user_show
  end

  private

  def feed_all
    @feed_items = @user.feed.publish.feed_sort.page(params[:page]).per_page Settings.post.number_show
  end
end
