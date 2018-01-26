require "routing_helpers"

Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  extend RoutingHelpers
  root to: "home#index", as: :root

  get "/about", to: "about#index", as: :about
  get "/contact", to: "contact#index", as: :contact
  post "/contact", to: "contact#message", as: :messages
  get "/search", to: "search#index", as: :search

  post "/alexa/say-hello", to: "alexa#say_hello"
  get "/mobile_debug", to: "home#mobile_debug"

  scope "/portfolios" do
    get "/", to: "portfolios#index", as: :portfolios
    get "/roles/:role", to: "portfolios#roles", as: :roles_portfolios
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
