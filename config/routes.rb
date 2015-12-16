Rails.application.routes.draw do
  get "/", to: "home#index"
  get "/about", to: "about#index"
  get "/posts/tagged/:tag_name", to: "posts#tagged", as: :tagged_posts

  get "*unmatched_route", to: "application#missing_page"
end
