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
    it "has many tagged posts" do
      visit "/posts/tagged/rspec"
      expect(page).to have_content "how to rspec"
      expect(page).to have_content "rspec troubleshooting"
      expect(page).not_to have_content "something else"
    end
  end

  context "blog" do
    it "has many blog posts" do
      visit "/posts/blog"
      expect(page).to have_content "how to rspec"
      expect(page).to have_content "rspec troubleshooting"
      expect(page).not_to have_content "something else"
    end
  end
end