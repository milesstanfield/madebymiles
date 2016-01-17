require "spec_helper"
include ApplicationHelper

describe NavigationHelper, type: :helper do
  context ".nav_tabs(active_tab)" do
    it "has tabs and their respective paths in order" do
      expect(nav_tabs("home").map(&:text)).to eq ["home", "about", "tutorials", "portfolio", "blog", "contact"]
      expect(nav_tabs("home").map(&:path)).to eq ["/", "/about", "/posts/tutorials", "/portfolio", "/posts/blog", "/contact"]
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
    expect(nav_tabs("foo").last.classes).to eq "m-font-thin m-color-white m-font-medium l-relative"
  end

  def active_tab_expectations
    @active_nav_tab = "contact"
    expect(nav_tabs("contact").last.text).to eq "contact"
    expect(nav_tabs("contact").last.classes).to eq "m-font-bold m-underline-white m-color-white m-font-medium l-relative"
  end
end
