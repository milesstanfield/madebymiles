class HomeController < ApplicationController
  def index
    @blog_posts = Post.where(use: "blog").order("created_at").reverse_order.limit(6)
  end
end