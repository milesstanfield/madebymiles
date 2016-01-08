class PostsController < ApplicationController
  def tagged
    @title_tag = "#{params[:tag_name]} posts"
    @posts = Post.by_tag_name(params[:tag_name]).limit(25)
    @meta_tags = []
  end

  def blog
    page = Page.by_name_or_create "blog"
    @active_nav_tab = page.active_nav_tab
    @title_tag = page.title_tag
    @meta_tags = page.meta_tags
    @posts = Post.blog.limit(25)
  end

  def tutorials
    page = Page.by_name_or_create "tutorials"
    @active_nav_tab = page.active_nav_tab
    @title_tag = page.title_tag
    @meta_tags = page.meta_tags
    @posts = Post.tutorials.limit(25)
  end

  def show
    post = Post.find_by_slug params[:slug]
    @post_presenter = PostPresenter.new(post, self)
    @active_nav_tab = @post_presenter.use == "tutorial" ? "tutorials" : "blog"
    @title_tag = @post_presenter.title
    @meta_tags = []
  end
end
