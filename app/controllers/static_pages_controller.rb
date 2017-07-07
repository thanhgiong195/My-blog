class StaticPagesController < ApplicationController
  before_action :load_all_post, only: :home

  def home
    if user_signed_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.feed_sort.page(params[:page]).per_page Settings.post.number_show
    else
      @feed_items = @post_all
    end
  end

  private

  def load_all_post
    @post_all = Post.all.publish.feed_sort.page(params[:page]).per_page Settings.post.number_show
  end
end
