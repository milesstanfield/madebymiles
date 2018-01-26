class HomeController < ApplicationController
  before_action :load_settings

  def index
    page = Page.by_name_or_create "home"
    @active_nav_tab = page.active_nav_tab
    @title_tag = page.title_tag
    @meta_tags = page.meta_tags
    @blog_posts = Post.blog.recent.limit(6)
    @tutorial_posts = Post.tutorials.recent.limit(6)
    @portfolios = Portfolio.recent.published.limit(3)
  end

  def mobile_debug
    Rails.logger.info(params)
    render nothing: true
  end
end
