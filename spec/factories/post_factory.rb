FactoryGirl.define do
  factory :post do
    title "title of post"
    use "blog"
    body "lorem ipsum doloar amid set"
    teaser "this is my teaser"
  end
end