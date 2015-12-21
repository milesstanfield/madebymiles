class PostsController < ApplicationController

  def tagged
    @posts = Post.by_tag_name(params[:tag_name]).limit(25)
  end

  def blog
    @active_nav_tab = "blog"
    @posts = Post.blog.limit(25)
  end

  def tutorials
    @active_nav_tab = "tutorials"
    @posts = Post.tutorials.limit(25)
  end

  def show
    @post = Post.find_by_slug params[:slug]
    @active_nav_tab = @post.use == "tutorial" ? "tutorials" : "blog"
  end
end
