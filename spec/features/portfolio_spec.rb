require "spec_helper"

describe "portfolio pages" do
  before do
    create_portfolio_and_related
  end

  context "show page" do
    it "has portfolio content" do
      portfolio = Portfolio.first
      visit portfolio.path
      expect(page).to have_text "my portfolio title"
      expect(page).to have_text "Developer"
    end
  end

  context "index page" do
    it "has portfolio content" do
      visit "/portfolios"
      expect(page).to have_text "my portfolio title"
      expect(page).to have_text "Developer"
    end
  end
end
