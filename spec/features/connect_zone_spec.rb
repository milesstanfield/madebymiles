require "spec_helper"
include ConnectZoneTestHelper

describe "connect zone", type: :feature do
  before do
    create_posts_and_tags("blog")
    create_posts_and_tags("tutorial")
  end

  context "home page" do
    connect_zone_expectations "/"
  end

  context "about page" do
    connect_zone_expectations "/about"
  end

  context "portfolio page" do
    connect_zone_expectations "/portfolio"
  end

  context "connect page" do
    connect_zone_expectations "/connect"
  end

  context "tutorials page" do
    connect_zone_expectations "/posts/tutorials"
  end

  context "blog page" do
    connect_zone_expectations "/posts/blog"
  end

  context "404 page" do
    connect_zone_expectations "/badrequest"
  end
end