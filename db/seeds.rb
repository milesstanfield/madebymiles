Post.delete_all
Tag.delete_all
["rails", "rspec", "git", "heroku", "bash", "haml", "scss"].each_with_index do |tag_name, index|
  blog_post = Post.create(title: "Why you should use #{tag_name}", use: "blog")
  blog_post.tags.create(name: "#{tag_name}tag")
  tutorial_post = Post.create(title: "Why you should use #{tag_name}", use: "tutorial")
  tutorial_post.tags.create(name: "#{tag_name}tag")
end

puts "done"