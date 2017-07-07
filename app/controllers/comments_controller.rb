class CommentsController < ApplicationController
  before_action :load_post, only: [:create, :destroy]
  before_action :load_comment, only: [:destroy, :create]

  def create
    @comment = @post.comments.build comment_params
    @comment.user_id = current_user.id
    if @comment.save
      render json: {status: :success, html: render_to_string(@comment)}
    else
      render json: {status: :error, html: "error"}
    end
  end

  def destroy
    if @comment.destroy
      render json: {status: :success, html: render_to_string(@comment)}
    else
      render json: {status: :error, html: "error"}
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content
  end

  def load_post
    @post = Post.find_by id: params[:post_id]
  end

  def load_comment
    @post = Post.find_by id: params[:post_id]
    @comment = @post.comments.find_by id: params[:id]
  end
end
