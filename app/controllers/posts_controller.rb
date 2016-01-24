class PostsController < ApplicationController
  before_action :load_settings

  def tagged
    @title_tag = "#{params[:tag_name]} posts"
    posts_by_tag_names = Post.by_tag_name(params[:tag_name])
    @posts = posts_by_tag_names.recent.published.limit(25)
    @meta_tags = []
  end

  def blog
    page = Page.by_name_or_create "blog"
    @active_nav_tab = page.active_nav_tab
    @title_tag = page.title_tag
    @meta_tags = page.meta_tags
    @posts = Post.blog.recent.published.limit(25)
  end

  def tutorials
    page = Page.by_name_or_create "tutorials"
    @active_nav_tab = page.active_nav_tab
    @title_tag = page.title_tag
    @meta_tags = page.meta_tags
    @posts = Post.tutorials.recent.published.limit(25)
  end

  def show
    post = Post.find_by_slug params[:slug]
    @presented_post = PostPresenter.new post
    @active_nav_tab = @presented_post.use == "tutorial" ? "tutorials" : "blog"
    @title_tag = @presented_post.title
    @meta_tags = []
    return missing_page unless post.published? || user_signed_in?
  end
end
