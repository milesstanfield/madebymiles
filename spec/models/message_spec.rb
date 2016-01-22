require "spec_helper"

describe Message do
  it "has string/text attributes" do
    string_attributes_expectations "sender_name", "sender_email", "subject", "body"
  end

  it "has a boolean sent attr (default false)" do
    message = Message.create sender_email: "miles@madebymiles.com"
    expect(message.read).to eq false
  end

  it "must have a valid sender_email" do
    expect(Message.count).to eq 0
    Message.create sender_email: nil
    expect(Message.count).to eq 0
    FactoryGirl.create :message
    expect(Message.count).to eq 1
  end

  it "gets unread messages" do
    unread_message = FactoryGirl.create :message
    FactoryGirl.create :message, read: true
    expect(Message.unread.count).to eq 1
    expect(Message.first).to eq unread_message
  end

  it ".mark_as_read(messages)" do
    FactoryGirl.create :message, subject: "test"
    expect(Message.find_by_subject("test").read).to eq false
    Message.mark_as_read(Message.all)
    expect(Message.find_by_subject("test").read).to eq true
  end
end
