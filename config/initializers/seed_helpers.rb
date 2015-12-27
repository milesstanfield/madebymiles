module SeedHelpers
  def create_posts_and_tags(use = "blog")
    tags.each_with_index do |tag_name, index|
      post = Post.create(title: "Why you should use #{tag_name}", use: use,
        created_at: Time.now - (index + 1).hours, teaser: "tease for post about #{tag_name}")

      if Tag.exists?(name: "#{tag_name}tag")
        post.tags << Tag.find_by_name("#{tag_name}tag")
      else
        post.tags.create name: "#{tag_name}tag"
      end
    end
  end

  def tags
    ["rails", "rspec", "git", "heroku", "bash", "haml", "scss"]
  end

  def create_activate_flippers(*names)
    names.each {|name| FeatureFlipper.create(name: name, active: true) }
  end
end