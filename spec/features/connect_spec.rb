require "spec_helper"

describe "connect page", type: :feature do
  it "has MadeByMiles | connect title tag" do
    visit "/connect"
    expect(page).to have_title "MadeByMiles | connect"
  end

  it "renders the connect page" do
    visit "/connect"
    expect(page).to have_text "connect page"
  end

  it "has a connect zone" do
    visit "/connect"
    connect_zone_expectations
  end
end
