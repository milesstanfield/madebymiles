class PostsController < ApplicationController
  def tagged
    @posts = Post.by_tag_name(params[:tag_name]).limit(25)
    @title_tag = "#{params[:tag_name]} posts"
  end

  def blog
    page = Page.by_name_or_create "blog"
    @active_nav_tab = page.active_nav_tab
    @title_tag = page.title_tag
    @posts = Post.blog.limit(25)
  end

  def tutorials
    page = Page.by_name_or_create "tutorials"
    @active_nav_tab = page.active_nav_tab
    @title_tag = page.title_tag
    @posts = Post.tutorials.limit(25)
  end

  def show
    @post = Post.find_by_slug params[:slug]
    @active_nav_tab = @post.use == "tutorial" ? "tutorials" : "blog"
    @title_tag = @post.title
  end
end
