require "spec_helper.rb"
require "rails_helper.rb"

describe "home page", type: :feature do
  it "has a splash section" do
    visit "/"
    within "[data-name='splash-area']" do
      expect(page).to have_content("DEVELOPER") &&
        have_content("DESIGNER") &&
        have_content("TEACHER") &&
        have_content("Lorem Ipsum is simply dummy text of the printing and typesetting
          industry. Lorem Ipsum has been the industry's standard dummy text")
    end
  end
end