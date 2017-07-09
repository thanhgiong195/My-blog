class StaticPagesController < ApplicationController
  before_action :post_all, :top_post, only: :home

  def home
    @users = User.all
    if user_signed_in?
      @feed_items = current_user.feed.feed_sort.page(params[:page]).per_page Settings.post.number_show
    else
      @feed_items
    end
  end

  private

  def post_all
    @feed_items = Post.all.publish.feed_sort.page(params[:page]).per_page Settings.post.number_show
  end

  def top_post
    @top_post = Post.top_post
  end
end
