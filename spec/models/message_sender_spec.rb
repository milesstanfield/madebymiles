require "spec_helper"
require "uri"

describe MessageSender do
  before do
    FactoryGirl.create :message, body: "message 1"
    FactoryGirl.create :message, body: "message 2"
  end

  it ".send_messages(messages)" do
    VCR.use_cassette "mail messages" do |cassette|
      MessageSender.send Message.unread
      payload = URI.decode cassette.serializable_hash.to_s
      expect(payload.include? "MAILGUN_API_KEY").to eq true
      expect(payload.include? "message 1").to eq true
      expect(payload.include? "message 2").to eq true
    end
  end
end