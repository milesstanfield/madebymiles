require "routing_helpers"

Rails.application.routes.draw do
  extend RoutingHelpers
  root to: "home#index", as: :root

  get "/about", to: "about#index", as: :about
  get "/connect", to: "connect#index", as: :connect
  get "/portfolio", to: "portfolio#index", as: :portfolio

  scope "/posts" do
    get "/blog", to: "posts#blog", as: :blog_posts
    get "/tutorials", to: "posts#tutorials", as: :tutorial_posts
    get "/tagged/:tag_name", to: "posts#tagged", as: :tagged_posts
    get '/*slug', to: "posts#show", constraints: {slug: post_slug_regex}, as: :post
  end

  get "*unmatched_route", to: "application#missing_page"
end
