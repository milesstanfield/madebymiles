require "spec_helper"

describe "admin", type: :feature do
  context "logging in" do
    before do
      User.create(email: "admin@example.com", password: "password")
    end

    it "logs user in" do
      visit "/admin"
      fill_in "user_email", with: "admin@example.com"
      fill_in "user_password", with: "password"
      click_button "Login"
      expect(page).to have_content "Posts"
    end
  end

  context "feature flippers" do
    before do
      login
    end

    it "has a feature flipper tab in header" do
      within "#header" do
        expect(page).to have_link "Feature Flippers"
      end
    end
  end

  context "posts" do
    before do
      login
    end

    it "creates a post with redcarpet/markdown format on body attribute" do
      click_link "Posts"
      click_link "New Post"
      fill_in "Title", with: "How to write an rspec controller test"
      fill_in "Teaser", with: "How to write a controller test"
      select("tutorial", from: "Use")
      fill_in "Body", with: "first you do this \n > with quote"
      click_button "Create Post"
      expect(page).to have_content "successfully created"
      expect(Post.count).to eq 1

      visit Post.first.path
      expect(page).to have_content "foo"
    end
  end

  context "tags" do
    before do
      login
    end

    it "has a tags tab in header" do
      within "#header" do
        expect(page).to have_link "Tags"
      end
    end
  end

  context "pages" do
    before do
      login
    end

    it "has a pages tab in header" do
      within "#header" do
        expect(page).to have_link "Pages"
      end
    end
  end

  context "meta tags" do
    before do
      login
    end

    it "has a meta tags tab in header" do
      within "#header" do
        expect(page).to have_link "Meta Tags"
      end
    end
  end

  def login
    create_admin_user
    visit "/admin"
    fill_in "user_email", with: "admin@example.com"
    fill_in "user_password", with: "password"
    click_button "Login"
  end
end