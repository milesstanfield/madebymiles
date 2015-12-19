Post.delete_all
Tag.delete_all
["rails", "rspec", "git", "heroku", "bash", "haml", "scss"].each_with_index do |tag_name, index|
  blog_post = Post.create(title: "Why you should use #{tag_name}", use: "blog", teaser: "tease for blog post about #{tag_name}")
  tutorial_post = Post.create(title: "Why you should use #{tag_name}", use: "tutorial", teaser: "tease for tutorial post about #{tag_name}")
  tag = Tag.create(name: "#{tag_name}tag")

  blog_post.tags << tag
  tutorial_post.tags << tag
end

puts "done"