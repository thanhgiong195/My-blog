class UsersController < ApplicationController
  load_resource only: :show
  before_action :feed_all, only: :show

  def show
    @follow_user = current_user.active_relationships.build if user_signed_in?

    if current_user == @user
      @feed_items = current_user.feed.feed_sort.page(params[:page]).per_page Settings.post.number_show
    else
      @feed_items
    end
  end

  def index
    @users = User.order(:name).page(params[:page]).per_page Settings.user.user_show
  end

  def following
    @user = User.find_by id: params[:id]
    @users = @user.following.paginate page: params[:page]
    render "show_follow"
  end

  def followers
    @user = User.find_by id: params[:id]
    @users = @user.followers.paginate page: params[:page]
    render "show_follow"
  end

  private

  def feed_all
    @feed_items = @user.feed.publish.feed_sort.page(params[:page]).per_page Settings.post.number_show
  end
end
