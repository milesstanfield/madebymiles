require "spec_helper.rb"
require "rails_helper.rb"

describe Navigation do

  context ".tabs" do
    it "has tabs and their respective paths in order" do
      expect(described_class.tabs.map(&:text)).to eq ["home", "about", "blog", "portfolio", "connect"]
      expect(described_class.tabs.map(&:path)).to eq ["/", "/about", "/blog", "/porfolio", "/connect"]
    end

    it "has obj methods accessible with . (open struct)" do
      expect(described_class.tabs.first.text).to eq "home"
      expect(described_class.tabs.first.path).to eq "/"
    end
  end

end