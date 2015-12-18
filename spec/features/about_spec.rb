require "spec_helper"

describe "about page", type: :feature do
  it "has MadeByMiles | about title tag" do
    visit "/about"
    expect(page).to have_title "MadeByMiles | about"
  end

  it "has about me section" do
    visit "/about"
    expect(page).to have_text "about page"
  end
end
