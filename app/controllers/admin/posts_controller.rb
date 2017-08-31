class Admin::PostsController < ApplicationController
  before_action :check, only: :index
  load_and_authorize_resource

  def index
    @posts = Post.order(:title).page(params[:page]).per_page 30
    respond_to do |format|
      format.html {@posts = Post.all}
      format.csv { send_data @posts.to_csv }
      format.xls { render text: @posts.to_csv(col_sep: "\t") }
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = t ".delete_success"
      redirect_to admin_posts_path
    else
      flash[:danger] = t ".failed_delete"
      redirect_to admin_posts_path
    end
  end
end
