require "spec_helper"

describe "error page", type: :feature do
  before do
    create_setting
  end

  it "has MadeByMiles title tag" do
    visit "/some_bad_request"
    expect(page).to have_title "MadeByMiles"
  end

  it "renders missing_page template on bad request" do
    visit "/some_bad_request"
    expect(page).to have_text "404"
  end
end
