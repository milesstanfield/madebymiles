FactoryGirl.define do
  factory :post do
    title "title of post"
    use "blog"
    body "lorem ipsum doloar amid set"
  end
end