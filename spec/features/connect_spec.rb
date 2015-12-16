require "spec_helper.rb"

describe "connect page", type: :feature do
  it "has MadeByMiles | connect title tag" do
    visit "/connect"
    expect(page).to have_title "MadeByMiles | connect"
  end

  it "renders the connect page" do
    visit "/connect"
    expect(page).to have_content "connect page"
  end
end