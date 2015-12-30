require "spec_helper"
include NavTestHelper

describe "the nav", type: :feature do
  before do
    create_posts_and_tags("blog")
    create_posts_and_tags("tutorial")
  end

  context "home page" do
    it_has_clickable_logo "/"
    it_has_clickable_tags "/"
    it_has_mobile_hamburger_functionality "/"
  end

  context "about page" do
    it_has_clickable_logo "/about"
    it_has_clickable_tags "/about"
    it_has_mobile_hamburger_functionality "/about"
  end

  context "portfolio page" do
    it_has_clickable_logo "/portfolio"
    it_has_clickable_tags "/portfolio"
    it_has_mobile_hamburger_functionality "/portfolio"
  end

  context "connect page" do
    it_has_clickable_logo "/connect"
    it_has_clickable_tags "/connect"
    it_has_mobile_hamburger_functionality "/connect"
  end

  context "tutorials page" do
    it_has_clickable_logo "/posts/tutorials"
    it_has_clickable_tags "/posts/tutorials"
    it_has_mobile_hamburger_functionality "/post/tutorials"
  end

  context "blog page" do
    it_has_clickable_logo "/posts/blog"
    it_has_clickable_tags "/posts/blog"
    it_has_mobile_hamburger_functionality "/post/blog"
  end
end