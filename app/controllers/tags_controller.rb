class TagsController < ApplicationController
  def show
    tag = Tag.find_by id: params[:id]
    @tag_posts = tag.posts
  end
end
