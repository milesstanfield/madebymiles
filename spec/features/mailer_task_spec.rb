require 'spec_helper'
require 'rake'

describe "Mailer Rake Task", type: :feature do
  before do
    load "tasks/mailer.rake"
    FactoryGirl.create :message, body: "message 1"
    FactoryGirl.create :message, body: "message 2"
  end

  it "sends unread messages and marks them as read afterwards" do
    VCR.use_cassette "mail_messages2" do |cassette|
      expect(Message.unread.count).to eq 2
      Rake::Task["mail:unread_messages"].execute
      expect(Message.unread.count).to eq 0
      payload = URI.decode cassette.serializable_hash.to_s
      expect(payload.include? "MAILGUN_API_KEY").to eq true
      expect(payload.include? "message 1").to eq true
      expect(payload.include? "message 2").to eq true
    end
  end

  it "doesn't mail anything out if no unread messages" do
    VCR.use_cassette "should_never_get_created" do |cassette|
      Message.update_all(read: true)
      expect(Message.unread.count).to eq 0
      Rake::Task["mail:unread_messages"].execute
    end
  end
end
