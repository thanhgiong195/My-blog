class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: :home

  def home
    @post = current_user.posts.build
    @feed_items = current_user.feed.feed_sort.page(params[:page]).per_page Settings.post.number_show
  end
end
