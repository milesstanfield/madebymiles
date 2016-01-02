require "spec_helper"

describe "feature flipper", type: :feature do
  it "flips on/off tabs in nav and footer" do
    FeatureFlipper.delete_all
    visit "/"
    within "nav" do
      expect(page).not_to have_text "blog"
    end
    within "footer" do
      expect(page).not_to have_text "blog"
    end

    FeatureFlipper.create(name: "blog", active: true)
    visit "/"
    within "nav" do
      expect(page).to have_text "blog"
    end
    within "footer" do
      expect(page).to have_text "blog"
    end
  end

  it "flips on/off sections on homepage" do
    FeatureFlipper.delete_all
    visit "/"
    expect(page).not_to have_css "[data-area='blog']"

    FeatureFlipper.create(name: "blog", active: true)
    visit "/"
    expect(page).to have_css "[data-area='blog']"
  end

  it "flips on/off testimonial section of about page" do
    FeatureFlipper.delete_all
    visit "/about"
    expect(page).not_to have_css "[data-area='testimonials']"

    FeatureFlipper.create(name: "testimonials", active: true)
    visit "/about"
    expect(page).to have_css "[data-area='testimonials']"
  end
end