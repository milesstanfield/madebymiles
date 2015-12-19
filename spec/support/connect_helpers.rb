module ConnectHelpers

  def connect_expectations
    within "[data-area='connect']" do
      expect(page).to have_css ".stack_overflow"
      expect(page).to have_css ".email"
      expect(page).to have_css ".twitter"
      expect(page).to have_css ".facebook"
      expect(page).to have_css ".github"
    end
  end
end