require "spec_helper"
include NavFooterTestHelper

describe "the nav", type: :feature do
  before do
    create_posts_and_tags "blog"
    create_posts_and_tags "tutorial"
  end

  context "home page" do
    it "has a clickable logo" do
      clickable_logo_expectations "/"
    end

    it "has clickable tabs" do
      clickable_nav_tabs_expectations "/"
    end

    it "has a clickable hamgurger to open nav menu", js: true, driver: :selenium do
      hamburger_expectations "/"
    end
  end

  context "about page" do
    it "has a clickable logo" do
      clickable_logo_expectations "/about"
    end

    it "has clickable tabs" do
      clickable_nav_tabs_expectations "/about"
    end

    it "has a clickable hamgurger to open nav menu", js: true, driver: :selenium do
      hamburger_expectations "/about"
    end
  end

  context "portfolio page" do
    it "has a clickable logo" do
      clickable_logo_expectations "/portfolio"
    end

    it "has clickable tabs" do
      clickable_nav_tabs_expectations "/portfolio"
    end

    it "has a clickable hamgurger to open nav menu", js: true, driver: :selenium do
      hamburger_expectations "/portfolio"
    end
  end

  context "connect page" do
    it "has a clickable logo" do
      clickable_logo_expectations "/connect"
    end

    it "has clickable tabs" do
      clickable_nav_tabs_expectations "/connect"
    end

    it "has a clickable hamgurger to open nav menu", js: true, driver: :selenium do
      hamburger_expectations "/connect"
    end
  end

  context "tutorials page" do
    it "has a clickable logo" do
      clickable_logo_expectations "/posts/tutorials"
    end

    it "has clickable tabs" do
      clickable_nav_tabs_expectations "/posts/tutorials"
    end

    it "has a clickable hamgurger to open nav menu", js: true, driver: :selenium do
      hamburger_expectations "/posts/tutorials"
    end
  end

  context "blog page" do
    it "has a clickable logo" do
      clickable_logo_expectations "/posts/blog"
    end

    it "has clickable tabs" do
      clickable_nav_tabs_expectations "/posts/blog"
    end

    it "has a clickable hamgurger to open nav menu", js: true, driver: :selenium do
      hamburger_expectations "/posts/blog"
    end
  end

  context "tagged posts page" do
    it "has a clickable logo" do
      clickable_logo_expectations "/posts/tagged/rspec"
    end

    it "has clickable tabs" do
      clickable_nav_tabs_expectations "/posts/tagged/rspec"
    end

    it "has a clickable hamgurger to open nav menu", js: true, driver: :selenium do
      hamburger_expectations "/posts/tagged/rspec"
    end
  end

  context "post page" do
    it "has a clickable logo" do
      clickable_logo_expectations "/posts/#{Post.first.slug}"
    end

    it "has clickable tabs" do
      clickable_nav_tabs_expectations "/posts/#{Post.first.slug}"
    end

    it "has a clickable hamgurger to open nav menu", js: true, driver: :selenium do
      hamburger_expectations "/posts/#{Post.first.slug}"
    end
  end

  context "404 page" do
    it "has a clickable logo" do
      clickable_logo_expectations "/badrequest"
    end

    it "has clickable tabs" do
      clickable_nav_tabs_expectations "/badrequest"
    end

    it "has a clickable hamgurger to open nav menu", js: true, driver: :selenium do
      hamburger_expectations "/badrequest"
    end
  end
end