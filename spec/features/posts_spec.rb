require "spec_helper"

describe "posts pages", type: :feature do
  before do
    post1 = FactoryGirl.create(:post, title: "how to rspec", use: "blog")
    post2 = FactoryGirl.create(:post, title: "rspec troubleshooting", use: "blog")
    post3 = FactoryGirl.create(:post, title: "something else", use: "tutorial")
    rspec_tag = FactoryGirl.create(:tag, name: "rspec")
    post1.tags << rspec_tag
    post2.tags << rspec_tag
  end

  context "#tagged" do
    it "has MadeByMiles | tagged title tag" do
      visit "/posts/tagged/rspec"
      expect(page).to have_title "MadeByMiles | tagged posts"
    end

    it "has many tagged posts" do
      visit "/posts/tagged/rspec"
      expect(page).to have_text "how to rspec"
      expect(page).to have_text "rspec troubleshooting"
      expect(page).not_to have_text "something else"
    end

    it "has a connect zone" do
      visit "/posts/tagged"
      connect_expectations
    end
  end

  context "blog" do
    it "has MadeByMiles | blog title tag" do
      visit "/posts/blog"
      expect(page).to have_title "MadeByMiles | blog posts"
    end

    it "has many blog posts" do
      visit "/posts/blog"
      expect(page).to have_text "how to rspec"
      expect(page).to have_text "rspec troubleshooting"
      expect(page).not_to have_text "something else"
    end

    it "has a connect zone" do
      visit "/posts/blog"
      connect_expectations
    end
  end
end
