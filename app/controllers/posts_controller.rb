class PostsController < ApplicationController
  load_and_authorize_resource
  before_action :tag_all, only: :show

  def show
    @top_post = Post.top_post
  end

  def index
    if params[:q]
      @posts = Post.search(params[:q]).order(:title).page(params[:page]).per_page Settings.post.number_show
    else
      @posts = Post.all.publish
    end
  end

  def new
  end

  def create
    @post = current_user.posts.build post_params

    if @post.save
      flash[:success] = t ".post_success"
      redirect_to @post
    else
      @feed_items = []
      render :new
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

  def tag_all
    @tag_all = Tag.all
  end
end
