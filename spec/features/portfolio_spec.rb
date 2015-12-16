require "spec_helper"

describe "portfolio page" do
  it "has MadeByMiles | portfolio title tag" do
    visit "/portfolio"
    expect(page).to have_title "MadeByMiles | portfolio"
  end

  it "renders portfolio page" do
    visit "/portfolio"
    expect(page).to have_content "portfolio page"
  end
end