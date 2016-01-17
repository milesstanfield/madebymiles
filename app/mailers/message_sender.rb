class MessageSender
  class << self
    def send(messages)
      send_with_payload message_params(string_messages(messages))
    end

    private

    def client
      Mailgun::Client.new ENV.fetch('MAILGUN_API_KEY')
    end

    def message_params(joint_message)
      {
        from: 'miles@madebymiles.com',
        to: 'milesstanfield@gmail.com',
        subject: 'new madebymiles messages',
        text: joint_message
      }
    end

    def string_messages(messages)
      messages.map {|message| message.to_json}.join("\n\n\n\n")
    end

    def send_with_payload(payload)
      client.send_message ENV.fetch('MAILGUN_DOMAIN'), payload
    end
  end
end
