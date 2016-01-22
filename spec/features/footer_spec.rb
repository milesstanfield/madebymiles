require "spec_helper"
include NavFooterTestHelper

describe "the footer", type: :feature do
  before do
    create_posts_and_tags "blog"
    create_posts_and_tags "tutorial"
    create_setting
  end

  context "home page" do
    it "has clickable tabs" do
      clickable_all_tabs_expectations "/"
    end

    it "has legal copy" do
      legal_copy_expectations "/"
    end
  end

  context "about page" do
    it "has clickable tabs" do
      clickable_all_tabs_expectations "/about"
    end

    it "has legal copy" do
      legal_copy_expectations "/about"
    end
  end

  context "portfolio page" do
    it "has clickable tabs" do
      clickable_all_tabs_expectations "/portfolios"
    end

    it "has legal copy" do
      legal_copy_expectations "/portfolios"
    end
  end

  context "contact page" do
    it "has clickable tabs" do
      clickable_all_tabs_expectations "/contact"
    end

    it "has legal copy" do
      legal_copy_expectations "/contact"
    end
  end

  context "tutorials page" do
    it "has clickable tabs" do
      clickable_all_tabs_expectations "/posts/tutorials"
    end

    it "has legal copy" do
      legal_copy_expectations "/posts/tutorials"
    end
  end

  context "blog page" do
    it "has clickable tabs" do
      clickable_all_tabs_expectations "/posts/blog"
    end

    it "has legal copy" do
      legal_copy_expectations "/posts/blog"
    end
  end

  context "tagged posts page" do
    it "has clickable tabs" do
      clickable_all_tabs_expectations "/posts/tagged/rspec"
    end

    it "has legal copy" do
      legal_copy_expectations "/posts/tagged/rspec"
    end
  end

  context "post page" do
    it "has clickable tabs" do
      clickable_all_tabs_expectations "posts/#{Post.first.slug}"
    end

    it "has legal copy" do
      legal_copy_expectations "posts/#{Post.first.slug}"
    end
  end

  context "404 page" do
    it "has clickable tabs" do
      clickable_all_tabs_expectations "/badrequest"
    end

    it "has legal copy" do
      legal_copy_expectations "/badrequest"
    end
  end
end