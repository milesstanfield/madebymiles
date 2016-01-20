require 'rake'

namespace :mail do
  desc "mail out new messages"
  task :unread_messages => :environment do
    messages = Message.unread
    MessageSender.send(messages)
    Message.mark_as_read(messages)
  end
end
