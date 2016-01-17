require "spec_helper"
include ConnectZoneTestHelper

describe "connect zone", type: :feature do
  before do
    create_posts_and_tags "blog"
    create_posts_and_tags "tutorial"
    create_setting
  end

  context "home page" do
    it "has a connect zone" do
      connect_zone_expectations "/"
    end
  end

  context "about page" do
    it "has a connect zone" do
      connect_zone_expectations "/about"
    end
  end

  context "portfolio page" do
    it "has a connect zone" do
      connect_zone_expectations "/portfolio"
    end
  end

  context "connect page" do
    it "has a connect zone" do
      connect_zone_expectations "/connect"
    end
  end

  context "tutorials page" do
    it "has a connect zone" do
      connect_zone_expectations "/posts/tutorials"
    end
  end

  context "blog page" do
    it "has a connect zone" do
      connect_zone_expectations "/posts/blog"
    end
  end

  context "tagged posts page" do
    it "has a connect zone" do
      connect_zone_expectations "/posts/tagged/rspec"
    end
  end

  context "post page" do
    it "has a connect zone" do
      connect_zone_expectations "posts/#{Post.first.slug}"
    end
  end

  context "404 page" do
    it "has a connect zone" do
      connect_zone_expectations "/badrequest"
    end
  end
end