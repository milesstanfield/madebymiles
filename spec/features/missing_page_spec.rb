require "spec_helper.rb"

describe "missing page", type: :feature do
  it "renders missing_page template on bad request" do
    visit "/some_bad_request"
    expect(page).to have_content("404")
  end
end