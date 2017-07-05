class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :edit]
  before_action :correct_user, only: [:destroy, :edit, :update]
  before_action :load_post, only: :show

  def show
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

  def edit
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
    params.require(:post).permit :title, :description, :content
  end

  def correct_user
    @post = current_user.posts.find_by id: params[:id]

    redirect_to root_url if @post.nil?
  end

  def load_post
    @post = Post.find_by id: params[:id]

    redirect_to root_url if @post.nil?
  end
end
