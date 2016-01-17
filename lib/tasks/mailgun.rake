namespace :messages do
  desc "mail out new messages to Miles"
  task :mail do
    messages = Message.unread
    MessageSender.send(messages)
    Message.mark_as_read(messages)
  end
end
