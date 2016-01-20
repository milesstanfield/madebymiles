require "#{Rails.root}/spec/support/test_files.rb"

module SeedHelpers
  def create_portfolio
    portfolio = Portfolio.create(
      title: "my portfolio title",
      teaser: "RSpec is a behavior-driven development (BDD) framework for the Ruby programming language, inspired by JBehave. It contains its own mocking framework that is fully integrated into the framework based upon JMock. The framework can be considered a domain-specific language (DSL) and resembles a natural",
      body: "RSpec is a behavior-driven development (BDD) framework for the Ruby programming language, inspired by JBehave. It contains its own mocking framework that is fully integrated into the framework based upon JMock. The framework can be considered a domain-specific language (DSL) and resembles a natural",
    )
    file = Rack::Test::UploadedFile.new(test_image_path(:google))
    portfolio.cover_image = CoverImage.create(title: "my cover image", file: file)
    portfolio.save
  end

  def create_setting
    Setting.create(
      stack_overflow: "http://stackoverflow.com/users/3123370/milesstanfield",
      github: "https://github.com/milesstanfield",
      facebook: "/contact",
      twitter: "https://twitter.com/milesua",
      email: "mailto:miles@madebymiles.com"
    )
  end

  def create_posts_and_tags(use = "blog")
    tags.each_with_index do |tag_name, index|
      post = Post.create(
        title: "Why you should use #{tag_name}",
        use: use,
        created_at: Time.now - (index + 1).hours,
        teaser: "tease for post about #{tag_name}",
        body: "body for post about #{tag_name}"
      )

      if Tag.exists?(name: "#{tag_name}tag")
        post.tags << Tag.find_by_name("#{tag_name}tag")
      else
        post.tags.create name: "#{tag_name}tag"
      end
    end
  end

  def create_activate_flippers
    FeatureFlipper.available_names.each {|name| FeatureFlipper.create(name: name, active: true) }
  end

  def create_admin_user
    User.create(email: "admin@example.com", password: "password", password_confirmation: "password")
  end

  def create_pages_and_associated
    create_activate_flippers
    Page.create name: "home", active_nav_tab: "home", title_tag: "home"
    Page.create name: "about", active_nav_tab: "about", title_tag: "about"
    Page.create name: "portfolio", active_nav_tab: "portfolio", title_tag: "portfolio"
    Page.create name: "contact", active_nav_tab: "contact", title_tag: "contact"
    Page.create name: "tagged"
    Page.create name: "blog", active_nav_tab: "blog", title_tag: "blog"
    Page.create name: "tutorials", active_nav_tab: "tutorials", title_tag: "tutorials"
    Page.create name: "post"
    Page.create name: "404", title_tag: "404"

    Page.all.each do |page|
      page.meta_tags << MetaTag.create(attr: "name", attr_value: "description", content: "this is the description of this page")
      FeatureFlipper.all.each do |feature_flipper|
        page.feature_flippers << feature_flipper
      end
    end
  end

  private

  def tags
    ["rails", "rspec", "git", "heroku", "bash", "haml", "scss"]
  end
end
