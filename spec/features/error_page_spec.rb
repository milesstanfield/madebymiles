require "spec_helper.rb"

describe "error page", type: :feature do
  it "has MadeByMiles title tag" do
    visit "/some_bad_request"
    expect(page).to have_title "MadeByMiles"
  end

  it "renders missing_page template on bad request" do
    visit "/some_bad_request"
    expect(page).to have_content("404")
  end
end