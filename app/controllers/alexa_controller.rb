class AlexaController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session

  def say_hello

    alexa = AlexaRuby.new(request.body.read, disable_validations: true)

    speech = 'You are awesome!'

    alexa.response.tell(speech)               # will add outputSpeech node
    alexa.response.tell(speech, speech)       # outputSpeech node and reprompt node
    alexa.response.tell(speech, speech, true) # outputSpeech node, reprompt node and both will be converted into SSML

    response = alexa.response.tell!(speech)              # will add outputSpeech node and return JSON encoded response object


    render json: response
  end
end
