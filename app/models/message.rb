class Message < ActiveRecord::Base
  validates :sender_email, presence: true, email: true
  scope :unread, -> { where read: false }

  def self.mark_as_read(messages)
    messages.each do |message|
      message.update(read: true)
    end
  end
end
