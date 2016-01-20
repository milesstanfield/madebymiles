require "routing_helpers"

Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  extend RoutingHelpers
  root to: "home#index", as: :root

  get "/about", to: "about#index", as: :about
  get "/contact", to: "contact#index", as: :contact
  post "/contact", to: "contact#message", as: :messages

  scope "/portfolios" do
    get "/", to: "portfolios#index", as: :portfolios
    get "/*slug", to: "portfolios#show", constraints: {slug: date_time_slug_regex}, as: :portfolio
  end

  scope "/posts" do
    get "/blog", to: "posts#blog", as: :blog_posts
    get "/tutorials", to: "posts#tutorials", as: :tutorial_posts
    get "/tagged/:tag_name", to: "posts#tagged", as: :tagged_posts
    get "/*slug", to: "posts#show", constraints: {slug: date_time_slug_regex}, as: :post
  end

  get "*unmatched_route", to: "application#missing_page"
end
