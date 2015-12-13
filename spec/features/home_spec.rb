require "spec_helper.rb"

describe "home page", type: :feature do
  it "has a splash section" do
    visit "/"
    within "[data-name='splash']" do
      expect(page).to have_content("DEVELOPER") &&
        have_content("DESIGNER") &&
        have_content("TEACHER") &&
        have_content("Lorem Ipsum is simply dummy text of the printing and typesetting
          industry. Lorem Ipsum has been the industry's standard dummy text")
    end
  end

  it "has an about section" do
    visit "/"
    within "[data-name='about']" do
      expect(page).to have_content("about") &&
        have_css("img[src='/assets/cog_orange.png']") &&
        have_css("img[src='/assets/profile_head.png']") &&
        have_content("Lorem Ipsum is simply dummy text of the printing and typesetting industry.
          Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown
          printer took a galley of type and scrambled it to make a. It has survived not only five centuries,
          but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised
          in the 1960s with the release of Letraset sheets containing") &&
        have_content("more") &&
        have_css("a[href='/']")
    end
  end
end