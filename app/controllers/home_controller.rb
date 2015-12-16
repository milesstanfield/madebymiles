class HomeController < ApplicationController
  def index
    @blog_posts = Post.blogs.recent.limit(4)
    @tutorial_posts = Post.tutorials.recent.limit(4)
  end
end