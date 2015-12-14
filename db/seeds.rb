["rails", "rspec", "git", "heroku", "bash", "haml", "scss"].each_with_index do |tag_name, index|
  post = FactoryGirl.create(:post, title: "Why you should use #{tag_name}", use: "blog", created_at: Time.now - (index + 1).hours)
  post.tags.create(name: "#{tag_name}tag")
end