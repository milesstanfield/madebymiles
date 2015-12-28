require "spec_helper"

describe "portfolio page" do
  it "has MadeByMiles | portfolio title tag" do
    visit "/portfolio"
    expect(page).to have_title "MadeByMiles | portfolio"
  end

  it "has a connect zone" do
    visit "/portfolio"
    connect_zone_expectations
  end
end
