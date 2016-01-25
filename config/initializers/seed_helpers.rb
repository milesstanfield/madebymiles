require "#{Rails.root}/spec/support/test_files.rb"

module SeedHelpers
  def create_portfolio_and_related(image = :google, title = "my portfolio title")
    teaser = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis"
    body = "first you do this\r\n \r\n> this is a quote \r\n\r\nthen you embed an image ![Alt text](https://s3.amazonaws.com/assets.madebymiles.com/uploads/google_bars.jpg) \r\n\r\nalso inline link here [my link](www.google.com) i can also **bold** text"
    portfolio = FactoryGirl.create :portfolio, title: title, teaser: teaser, body: body, published: true
    portfolio.roles.create(title: "Developer")
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
    Page.create name: "portfolios", active_nav_tab: "portfolio", title_tag: "portfolio"
    Page.create name: "portfolio", active_nav_tab: "portfolio", title_tag: "portfolio"
    Page.create name: "contact", active_nav_tab: "contact", title_tag: "contact"
    Page.create name: "tagged"
    Page.create name: "blog", active_nav_tab: "blog", title_tag: "blog"
    Page.create name: "tutorials", active_nav_tab: "tutorials", title_tag: "tutorials"
    Page.create name: "post"
    Page.create name: "404", title_tag: "404"
    Page.create name: "search"

    Page.all.each do |page|
      page.meta_tags << MetaTag.create(tag_type: "meta", attr: "name", attr_value: "description", content_type: "content", content: "this is the description of this page")
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
