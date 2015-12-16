class PostsController < ApplicationController
  def tagged
    @posts_by_tags = Post.by_tag_name(params[:tag_name]).limit(25)
  end
end