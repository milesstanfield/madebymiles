require "spec_helper"

describe Message do
  it "has string/text attributes" do
    ["sender_name", "sender_email", "subject", "body"].each do |attribute|
      record = described_class.new
      record.send("#{attribute}=", "some string")
      expect(record.send("#{attribute}")).to eq "some string"
    end
  end

  it "must have a valid sender_email" do
    expect(Message.count).to eq 0
    Message.create sender_email: "foobar"
    expect(Message.count).to eq 0
    Message.create sender_email: "miles@madebymiles.com"
    expect(Message.count).to eq 1
  end
end
