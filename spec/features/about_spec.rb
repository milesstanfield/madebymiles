require "spec_helper"

describe "about page", type: :feature do
  it "has MadeByMiles | about title tag" do
    visit "/about"
    expect(page).to have_title "MadeByMiles | about"
  end

  it "has a connect zone" do
    visit "/about"
    connect_zone_expectations
  end
end
