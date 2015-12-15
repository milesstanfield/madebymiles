class HomeController < ApplicationController
  def index
    @blog_posts = Post.blogs.recent.limit(6)
    @tutorial_posts = Post.tutorials.recent.limit(6)
  end
end