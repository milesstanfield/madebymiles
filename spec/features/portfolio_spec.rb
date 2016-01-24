require "spec_helper"

describe "portfolio pages" do
  before do
    FactoryGirl.create :portfolio, title: "My Fake Portfolio 1", published: true
    FactoryGirl.create :portfolio, title: "My Fake Portfolio 2", published: false
    FactoryGirl.create :portfolio, title: "My Fake Portfolio 3", published: true
    FactoryGirl.create :portfolio, title: "My Fake Portfolio 4", published: true
    FactoryGirl.create :portfolio, title: "My Fake Portfolio 5", published: false
    FactoryGirl.create :portfolio, title: "My Fake Portfolio 6", published: false
  end

  context "#show" do
    it "has portfolio content" do
      portfolio = Portfolio.find_by_title("My Fake Portfolio 1")
      visit portfolio.path
      expect(page).to have_text "My Fake Portfolio 1"
      expect(page).to have_text "Developer"
    end

    it "redirects to 404 if not published" do
      portfolio = Portfolio.find_by_title("My Fake Portfolio 2")
      visit portfolio.path
      expect(page).to have_css "[data-area='404']"
    end

    context "sidebar" do
      it "doesn't show the unpublished portfolios" do
        portfolio = Portfolio.find_by_title("My Fake Portfolio 1")
        visit portfolio.path
        within "[data-area='sidebar']" do
          expect(page).to have_text "My Fake Portfolio 1"
          expect(page).not_to have_text "My Fake Portfolio 2"
          expect(page).to have_text "My Fake Portfolio 3"
          expect(page).to have_text "My Fake Portfolio 4"
          expect(page).not_to have_text "My Fake Portfolio 5"
          expect(page).not_to have_text "My Fake Portfolio 6"
        end
      end
    end
  end

  context "#index" do
    it "has published portfolios" do
      visit "/portfolios"
      expect(page).to have_text "My Fake Portfolio 1"
      expect(page).not_to have_text "My Fake Portfolio 2"
      expect(page).to have_text "My Fake Portfolio 3"
      expect(page).to have_text "My Fake Portfolio 4"
      expect(page).not_to have_text "My Fake Portfolio 5"
      expect(page).not_to have_text "My Fake Portfolio 6"
    end
  end

  context "#roles" do
    before do
      portfolio1 = Portfolio.find_by_title("My Fake Portfolio 1")
      portfolio2 = Portfolio.find_by_title("My Fake Portfolio 2")
      role = FactoryGirl.create :role, title: "Developer"
      portfolio1.roles << role
      portfolio2.roles << role
    end

    it "has published portfolios by roles" do
      visit "/portfolios/roles/Developer"
      expect(page).to have_text "My Fake Portfolio 1"
      expect(page).to have_text "Developer"
      expect(page).not_to have_text "My Fake Portfolio 2"
    end
  end
end
