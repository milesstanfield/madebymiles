require "spec_helper"

describe FeatureFlipper do
  it "has string attributes" do
    ["name"].each do |attribute|
      record = described_class.new
      record.send("#{attribute}=", "some string")
      expect(record.send("#{attribute}")).to eq "some string"
    end
  end

  it "has boolean attributes" do
    ["active"].each do |attribute|
      record = described_class.new
      record.send("#{attribute}=", false)
      expect(record.send("#{attribute}")).to eq false
    end
  end

  it ".actives" do
    expect(FeatureFlipper.active_names).to eq []
    FeatureFlipper.create(name: "foo", active: true)
    expect(FeatureFlipper.active_names).to eq ["foo"]
  end

  it "can't create duplicate named flipper" do
    FeatureFlipper.create(name: "foo", active: true)
    expect(FeatureFlipper.count).to eq 1
    FeatureFlipper.create(name: "foo", active: true)
    expect(FeatureFlipper.count).to eq 1
  end
end
