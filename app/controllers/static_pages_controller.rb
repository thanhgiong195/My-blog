class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.feed_sort.page(params[:page]).per_page Settings.post.number_show
    else
      flash[:success] = t ".pl_login"
      redirect_to signin_path
    end
  end
end
