class UsersController < ApplicationController
  load_resource only: :show

  def show
    if current_user == @user
      @feed_items = @user.feed.feed_sort.page(params[:page]).per_page Settings.post.number_show
    else
      @feed_items = @user.feed.publish.feed_sort.page(params[:page]).per_page Settings.post.number_show
    end
  end
end
