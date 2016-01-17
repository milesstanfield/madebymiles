require "spec_helper"

describe Setting do
  it "has string/text attributes" do
    ["github", "stack_overflow", "facebook", "twitter", "email"].each do |attribute|
      record = described_class.new
      record.send("#{attribute}=", "some string")
      expect(record.send("#{attribute}")).to eq "some string"
    end
  end
end
