require "spec_helper"

describe NavigationHelper, type: :helper do
  context ".nav_tabs(active_tab)" do
    it "has tabs and their respective paths in order" do
      expect(nav_tabs("home").map(&:text)).to eq ["about", "tutorials", "portfolio", "blog", "contact"]
      expect(nav_tabs("home").map(&:path)).to eq ["/about", "/posts/tutorials", "/portfolios", "/posts/blog", "/contact"]
    end

    it "returns inactive classes for tabs that are inactive" do
      active_tab_expectations
    end

    it "returns active classes for tabs that are inactive" do
      inactive_tab_expectations
    end
  end

  context ".all_tabs(active_tab)" do
    it "has tabs and their respective paths in order" do
      expect(all_tabs("home").map(&:text)).to eq ["home", "about", "tutorials", "portfolio", "blog", "contact", "search"]
      expect(all_tabs("home").map(&:path)).to eq ["/", "/about", "/posts/tutorials", "/portfolios", "/posts/blog", "/contact", "/search"]
    end

    it "returns inactive classes for tabs that are inactive" do
      active_tab_expectations
    end

    it "returns active classes for tabs that are inactive" do
      inactive_tab_expectations
    end
  end

  def inactive_tab_expectations
    @active_nav_tab = "foo"
    expect(nav_tabs("foo").last.text).not_to eq "foo"
    expect(nav_tabs("foo").last.classes).to eq "m-thin m-color-white m-medium l-relative"
  end

  def active_tab_expectations
    @active_nav_tab = "contact"
    expect(nav_tabs("contact").last.text).to eq "contact"
    expect(nav_tabs("contact").last.classes).to eq "m-bold m-underline-white m-color-white m-medium l-relative"
  end
end
