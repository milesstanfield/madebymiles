class AlexaController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session

  def say_hello
    Rails.logger.info(headers)
    puts headers

    parsed_body = JSON.parse(request.body.read)

    unless parsed_body['context']['System']['device']['deviceId']
      parsed_body['context']['System']['device']['deviceId'] = 'TEST'
    end

    alexa = AlexaRuby.new(parsed_body.to_json, disable_validations: true)

    speech = 'You are awesome!'

    alexa.response.tell(speech)               # will add outputSpeech node
    alexa.response.tell(speech, speech)       # outputSpeech node and reprompt node
    alexa.response.tell(speech, speech, true) # outputSpeech node, reprompt node and both will be converted into SSML

    response = alexa.response.tell!(speech)              # will add outputSpeech node and return JSON encoded response object

    render json: response
  end
end
