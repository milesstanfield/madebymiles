require "spec_helper"

describe "posts pages", type: :feature do
  let(:post1) {FactoryGirl.create(:post, title: "how to rspec", use: "blog")}
  let(:post2) {FactoryGirl.create(:post, title: "rspec troubleshooting", use: "blog")}
  let(:post3) {FactoryGirl.create(:post, title: "how to do this thing", use: "tutorial")}

  before do
    create_and_associate_tags
  end

  context "/posts/tagged" do
    it "has many tagged posts" do
      visit "/posts/tagged/rspec"
      expect(page).to have_text "how to rspec"
      expect(page).to have_text "rspec troubleshooting"
      expect(page).not_to have_text "something else"
    end
  end

  context "/posts/blog" do
    it "has many blog posts" do
      visit "/posts/blog"
      expect(page).to have_text "how to rspec"
      expect(page).to have_text "rspec troubleshooting"
      expect(page).not_to have_text "something else"
    end
  end

  context "/posts/tutorials" do
    it "has many blog posts" do
      visit "/posts/tutorials"
      expect(page).to have_text "how to do this thing"
      expect(page).not_to have_text "rspec troubleshooting"
    end
  end

  context "posts/slug" do
    it "has title of post" do
      visit "posts/#{post1.slug}"
      expect(page).to have_text post1.title
    end
  end

  def create_and_associate_tags
    rspec_tag = FactoryGirl.create(:tag, name: "rspec")
    git_tag = FactoryGirl.create(:tag, name: "git")
    post1.tags << rspec_tag
    post2.tags << rspec_tag
    post3.tags << git_tag
  end
end
