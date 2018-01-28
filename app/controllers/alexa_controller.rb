class AlexaController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session

  def home
    Rails.logger.info(headers)
    puts headers

    if parsed_body.dig('request', 'intent', 'name') == 'SayHelloIntent'
      speech = 'hello miles!'
    elsif parsed_body.dig('request', 'intent', 'name') == 'SayGoodbyeIntent'
      speech = 'goodbye miles!'
    end

    render json: alexa.response.tell!(speech)
  end

  private

  def alexa
    @alexa ||= AlexaRuby.new(parsed_body.to_json, disable_validations: false)
  end

  def parsed_body
    @parsed_body ||= with_device_id(JSON.parse(request.body.read))
  end

  def with_device_id(body)
    # deviceId is required. but if your using the json tester it doesnt have one. so add it here
    unless body['context']['System']['device']['deviceId']
      body['context']['System']['device']['deviceId'] = 'TEST'
    end
    body
  end
end
