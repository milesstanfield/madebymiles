Rails.application.routes.draw do
  get "/", to: "home#index"
  get "/posts/tagged/:name", to: "posts#tags", as: :tagged_posts

  get "*unmatched_route", to: "application#missing_page"
end
