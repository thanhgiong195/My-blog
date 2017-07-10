class StaticPagesController < ApplicationController
  before_action :post_all, :top_post, :tag_all, only: :home

  def home
    @users = User.all
    if user_signed_in?
      @feed_items = current_user.feed.publish.feed_sort.page(params[:page]).per_page Settings.post.number_show
    else
      @feed_items
    end
  end

  def index
    if current_user.is_admin?
      @users = User.all
    else
      flash[:danger] = t ".can't"
      redirect_to root_path
    end
  end

  private

  def post_all
    @feed_items = Post.all.publish.feed_sort.page(params[:page]).per_page Settings.post.number_show
  end

  def top_post
    @top_post = Post.top_post.publish
  end

  def tag_all
    @tag_all = Tag.all
  end
end
