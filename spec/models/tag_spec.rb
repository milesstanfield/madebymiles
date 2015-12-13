require "spec_helper.rb"

describe Tag do
  it "has string attributes" do
    ["name"].each do |attribute|
      record = described_class.new
      record.send("#{attribute}=", "some string")
      expect(record.send("#{attribute}")).to eq "some string"
    end
  end

  it "has integer attributes" do
    ["post_id"].each do |attribute|
      record = described_class.new
      record.send("#{attribute}=", 123)
      expect(record.send("#{attribute}")).to eq 123
    end
  end
end