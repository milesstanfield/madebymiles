Rails.application.routes.draw do
  root to: "home#index"

  get "/about", to: "about#index", as: :about
  get "/connect", to: "connect#index", as: :connect
  get "/portfolio", to: "portfolio#index", as: :portfolio
  get "/posts/blog", to: "posts#blog", as: :blog_posts
  get "/posts/tagged/:tag_name", to: "posts#tagged", as: :tagged_posts

  get "*unmatched_route", to: "application#missing_page"
end
