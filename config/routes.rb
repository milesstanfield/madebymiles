Rails.application.routes.draw do
  get "/", to: "home#index"
  get "/posts/tagged/:name", to: "posts#tags", as: :tagged_posts
end
