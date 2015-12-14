["rails", "rspec", "git", "heroku", "bash", "haml", "scss"].each_with_index do |tag_name, index|
  post = Post.create(title: "Why you should use #{tag_name}", use: "blog")
  post.tags.create(name: "#{tag_name}tag")
end