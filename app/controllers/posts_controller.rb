class PostsController < ApplicationController
  def tagged
    @posts = Post.by_tag_name(params[:tag_name]).limit(25)
    @title_tag = "#{params[:tag_name]} posts"
  end

  def blog
    @active_nav_tab = "blog"
    @title_tag = "blog"
    @posts = Post.blog.limit(25)
  end

  def tutorials
    @active_nav_tab = "tutorials"
    @title_tag = "tutorials"
    @posts = Post.tutorials.limit(25)
  end

  def show
    @post = Post.find_by_slug params[:slug]
    @active_nav_tab = @post.use == "tutorial" ? "tutorials" : "blog"
    @title_tag = @post.title
  end
end
