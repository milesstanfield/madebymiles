require "routing_helpers"

Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  extend RoutingHelpers
  root to: "home#index", as: :root

  get "/about", to: "about#index", as: :about
  get "/contact", to: "contact#index", as: :contact
  post "/contact", to: "contact#message", as: :messages
  get "/contact-test", to: "contact#index_test", as: :contact_test
  post "/contact-test", to: "contact#message_test", as: :messages_test
  get "/contact-test2", to: "contact#index_test2", as: :contact_test2
  post "/contact-test2", to: "contact#message_test2", as: :messages_test2
  get "/search", to: "search#index", as: :search

  get "/chat", to: "home#chat"
  get "/chat2", to: "home#chat2"

  post "/alexa", to: "alexa#home"
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
