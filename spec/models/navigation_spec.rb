require "spec_helper"

describe Navigation do

  context ".tabs" do
    it "has tabs and their respective paths in order" do
      expect(Navigation.tabs.map(&:text)).to eq ["about", "tutorials", "portfolio", "blog", "connect"]
      expect(Navigation.tabs.map(&:path)).to eq ["/about", "/posts/tutorials", "/portfolio", "/posts/blog", "/connect"]
    end

    it "has footer tabs and their respective paths in order" do
      expect(Navigation.footer_tabs.map(&:text)).to eq ["home", "about", "tutorials", "portfolio", "blog", "connect"]
      expect(Navigation.footer_tabs.map(&:path)).to eq ["/", "/about", "/posts/tutorials", "/portfolio", "/posts/blog", "/connect"]
    end

    it "has obj methods accessible with . (open struct)" do
      expect(Navigation.tabs.first.text).to eq "about"
      expect(Navigation.tabs.first.path).to eq "/about"
    end
  end

  context ".active_tab_classes" do
    it "returns active nav tab classes if controller name matches tab text" do
      active_classes = "m-font-bold m-underline-white m-color-white m-font-medium l-relative"
      expect(Navigation.tab_classes("about", "about")).to eq active_classes
    end

    it "returns inactive classes if controller name does not match tab text" do
      inactive_classes = "m-font-thin m-color-white m-font-medium l-relative"
      expect(Navigation.tab_classes("about", "blog")).to eq inactive_classes
    end
  end
end
