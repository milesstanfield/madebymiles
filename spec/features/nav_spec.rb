require "spec_helper"
include NavTestHelper

describe "the nav", type: :feature do
  context "home page" do
    it_has_clickable_logo "/"
    it_has_clickable_tags "/"
  end

  context "about page" do
    it_has_clickable_logo "/about"
    it_has_clickable_tags "/about"
  end

  context "portfolio page" do
    it_has_clickable_logo "/portfolio"
    it_has_clickable_tags "/portfolio"
  end

  context "connect page" do
    it_has_clickable_logo "/connect"
    it_has_clickable_tags "/connect"
  end

  context "tutorials page" do
    it_has_clickable_logo "/posts/tutorials"
    it_has_clickable_tags "/posts/tutorials"
  end

  context "blog page" do
    it_has_clickable_logo "/posts/blog"
    it_has_clickable_tags "/posts/blog"
  end
end