require "spec_helper"

describe "title tag", type: :feature do
  before do
    create_posts_and_tags "blog"
    create_posts_and_tags "tutorial"
  end

  context "home page" do
    it "has a title tag" do
      visit "/"
      expect(page).to have_title "MadeByMiles | home"
    end
  end

  context "about page" do
    it "has a title tag" do
      visit "/about"
      expect(page).to have_title "MadeByMiles | about"
    end
  end

  context "portfolio page" do
    it "has a title tag" do
      visit "/portfolio"
      expect(page).to have_title "MadeByMiles | portfolio"
    end
  end

  context "connect page" do
    it "has a title tag" do
      visit "/connect"
      expect(page).to have_title "MadeByMiles | connect"
    end
  end

  context "tutorials page" do
    it "has a title tag" do
      visit "/posts/tutorials"
      expect(page).to have_title "MadeByMiles | tutorials"
    end
  end

  context "blog page" do
    it "has a title tag" do
      visit "/posts/blog"
      expect(page).to have_title "MadeByMiles | blog"
    end
  end

  context "tagged posts page" do
    it "has a title tag" do
      visit "/posts/tagged/rspec"
      expect(page).to have_title "MadeByMiles | rspec posts"
    end
  end

  context "post page" do
    it "has a title tag" do
      visit "posts/#{Post.first.slug}"
      expect(page).to have_title "MadeByMiles | #{Post.first.title}"
    end
  end

  context "404 page" do
    it "has a title tag" do
      visit "/badrequest"
      expect(page).to have_title "MadeByMiles | 404"
    end
  end
end