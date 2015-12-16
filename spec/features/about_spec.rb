require "spec_helper"

describe "about page", type: :feature do
  it "has about me section" do
    visit "/about"
    expect(page).to have_content "about page"
  end
end