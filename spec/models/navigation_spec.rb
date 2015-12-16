require "spec_helper.rb"

describe Navigation do

  context ".tabs" do
    it "has tabs and their respective paths in order" do
      expect(described_class.tabs.map(&:text)).to eq ["about", "tutorials", "portfolio", "blog", "connect"]
      expect(described_class.tabs.map(&:path)).to eq ["/about", "/posts/tutorials", "/porfolio", "/posts/blog", "/connect"]
    end

    it "has obj methods accessible with . (open struct)" do
      expect(described_class.tabs.first.text).to eq "about"
      expect(described_class.tabs.first.path).to eq "/about"
    end
  end

  context ".active_tab_classes" do
    it "returns active classes if controller name matches tab text" do
      vc = double(:vc, controller_name: "about")
      controller = double(:controller, view_context: vc)
      active_classes = "m-font-bold m-underline-white m-color-white m-font-medium l-nav-tab-text l-relative"
      expect(described_class.tab_classes(controller, "about")).to eq active_classes
    end

    it "returns inactive classes if controller name does not match tab text" do
      vc = double(:vc, controller_name: "about")
      controller = double(:controller, view_context: vc)
      inactive_classes = "m-font-thin m-color-white m-font-medium l-nav-tab-text l-relative"
      expect(described_class.tab_classes(controller, "blog")).to eq inactive_classes
    end
  end

end