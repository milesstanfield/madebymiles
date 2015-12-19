class PostsController < ApplicationController
  def tagged
    @posts = Post.by_tag_name(params[:tag_name]).limit(25)
  end

  def blog
    @posts = Post.blog.limit(25)
  end

  def tutorials
    @posts = Post.tutorials.limit(25)
  end

  def show
    @post = Post.find_by_slug params[:slug]
  end
end
