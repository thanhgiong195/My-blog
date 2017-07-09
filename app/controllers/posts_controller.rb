class PostsController < ApplicationController
  load_and_authorize_resource

  def show
    @top_post = Post.top_post
  end

  def create
    @post = current_user.posts.build post_params

    if @post.save
      flash[:success] = t ".post_success"
      redirect_to @post
    else
      flash.now[:danger] = t ".post_error"
      @feed_items = []
      redirect_to root_path
    end
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = t ".update_success"
      redirect_to @post
    else
      flash.now[:danger] = t ".update_fail"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = t ".delete_success"
      redirect_to root_path
    else
      flash.now[:danger] = t ".delete_error"
      render request.referer
    end
  end

  private

  def post_params
    params.require(:post).permit :title, :description, :content, :picture,
      :is_published, :all_tags
  end
end
