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
      expect(page).to have_text "Posts"
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
      page.check("Published")
      fill_in "Body", with: "first you do this \n > with quote"
      click_button "Create Post"
      expect(page).to have_text "successfully created"
      expect(Post.count).to eq 1

      visit Post.first.path
      within "p[class='l-medium-padding m-bg-quote']" do
        expect(page).to have_text "quote"
      end
    end
  end

  context "images" do
    before do
      login
    end

    it "uploads and saves an image" do
      click_link "All Images"
      click_link "Images"
      click_link "New Image"
      fill_in "Title", with: "image title"
      within "#image_file_input" do
        find("#image_file", visible: false).set(test_image_path)
      end
      click_button "Create Image"
      expect(page).to have_text "successfully created"
      expect(page).to have_css "img[src$='test-image-file-google.jpg']"
    end

    it "uploads and saves an cover image" do
      click_link "All Images"
      click_link "Cover Images"
      click_link "New Cover Image"
      fill_in "Title", with: "image title"
      within "#cover_image_file_input" do
        find("#cover_image_file", visible: false).set(test_image_path)
      end
      click_button "Create Cover image"
      expect(page).to have_text "successfully created"
      expect(page).to have_css "img[src$='test-image-file-google.jpg']"
    end
  end

  context "portfolio" do
    before do
      login
      image_file = Rack::Test::UploadedFile.new(test_image_path)
      CoverImage.create(file: image_file, title: "test image")
    end

    it "creates a new portfolio with markdown" do
      click_link "Portfolios"
      click_link "New Portfolio"
      fill_in "Title", with: "title of portfolio"
      fill_in "Teaser", with: "teaser of portfolio"
      fill_in "Body", with: "first you do this \n
        > this is a quote
        \n\n
        then you embed an image ![Alt text](https://s3.amazonaws.com/assets.madebymiles.com/uploads/google_bars.jpg)
        \n\n
        also inline link here [my link](www.google.com)
        \n\n
        i can also **bold** text"
      within "#portfolio_cover_images_input" do
        page.check('test image')
      end
      click_button "Create Portfolio"
      expect(page).to have_text "successfully created"
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