class AlexaController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session

  def home
    Rails.logger.info(headers)
    puts '*' * 1000
    puts headers

    case intent_name
    when 'SayHelloIntent'
      speech = 'hello miles!'
    when 'SayGoodbyeIntent'
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

  def intent_name
    parsed_body['request']['intent']['name']
  end

  def with_device_id(body)
    # deviceId is required. but if your using the json tester it doesnt have one. so add it here
    unless body['context']['System']['device']['deviceId']
      body['context']['System']['device']['deviceId'] = 'TEST'
    end
    body
  end
end
