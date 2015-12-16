class HomeController < ApplicationController
  def index
    @blog_posts = Post.blog.recent.limit(4)
    @tutorial_posts = Post.tutorials.recent.limit(4)
  end
end