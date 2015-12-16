require "spec_helper"

describe "portfolio page" do
  it "renders portfolio page" do
    visit "/portfolio"
    expect(page).to have_content "portfolio page"
  end
end