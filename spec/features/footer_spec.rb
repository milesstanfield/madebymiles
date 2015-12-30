require "spec_helper"
include NavTestHelper
include FooterTestHelper

describe "the footer", type: :feature do
  before do
    create_posts_and_tags("blog")
    create_posts_and_tags("tutorial")
  end

  context "home page" do
    it_has_clickable_tags "/", true
    it_has_legal_copy "/"
  end

  context "about page" do
    it_has_clickable_tags "/about", true
    it_has_legal_copy "/about"
  end

  context "portfolio page" do
    it_has_clickable_tags "/portfolio", true
    it_has_legal_copy "/portfolio"
  end

  context "connect page" do
    it_has_clickable_tags "/connect", true
    it_has_legal_copy "/connect"
  end

  context "tutorials page" do
    it_has_clickable_tags "/posts/tutorials", true
    it_has_legal_copy "/posts/tutorials"
  end

  context "blog page" do
    it_has_clickable_tags "/posts/blog", true
    it_has_legal_copy "/posts/blog"
  end
end