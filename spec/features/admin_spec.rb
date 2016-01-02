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

    it "has a post tab in header" do
      within "#header" do
        expect(page).to have_link "Posts"
      end
    end
  end

  context "tags" do
    before do
      login
    end

    it "has a tab tab in header" do
      within "#header" do
        expect(page).to have_link "Tags"
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