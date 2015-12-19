require "spec_helper"

describe "error page", type: :feature do
  it "has MadeByMiles title tag" do
    visit "/some_bad_request"
    expect(page).to have_title "MadeByMiles"
  end

  it "renders missing_page template on bad request" do
    visit "/some_bad_request"
    expect(page).to have_text "404"
  end

  it "has a connect zone" do
    visit "/some_bad_request"
    connect_expectations
  end
end
