class HomeController < ApplicationController
  def index
    page = Page.by_name_or_create "home"
    @active_nav_tab = page.active_nav_tab
    @title_tag = page.title_tag
    @blog_posts = Post.blog.recent.limit(4)
    @tutorial_posts = Post.tutorials.recent.limit(4)
  end
end
