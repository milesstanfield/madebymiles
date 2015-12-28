module ConnectTestHelpers
  def connect_zone_expectations
    within "[data-area='connect']" do
      expect(page).to have_css ".stack_overflow"
      expect(page).to have_css "a[href='http://stackoverflow.com/users/3123370/milesstanfield']"
      expect(page).to have_css ".github"
      expect(page).to have_css "a[href='https://github.com/milesstanfield']"
      expect(page).to have_css ".email"
      expect(page).to have_css ".twitter"
      expect(page).to have_css "a[href='https://twitter.com/milesua']"
      expect(page).to have_css ".facebook"
    end
  end
end
