require "spec_helper.rb"
require "rails_helper.rb"

describe "home page", type: :feature do
  it "has a splash section" do
    visit "/"
    within "[data-hook='splash-area']" do
      expect(page).to have_content("DEVELOPER") &&
        have_content("DESIGNER") &&
        have_content("TEACHER")
    end
  end
end