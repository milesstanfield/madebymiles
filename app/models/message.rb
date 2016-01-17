class Message < ActiveRecord::Base
  validates :sender_email, presence: true, email: true
end
