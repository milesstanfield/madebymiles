require "spec_helper.rb"

describe "connect page", type: :feature do
  it "renders the connect page" do
    visit "/connect"
    expect(page).to have_content "connect page"
  end
end