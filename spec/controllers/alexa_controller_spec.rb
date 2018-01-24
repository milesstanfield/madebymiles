require "spec_helper"

describe AlexaController, type: :controller do
  let(:headers) do
    {
      'HTTPS' => 'on',
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
  end

  let(:payload) do
    {
      "session": {
        "new": true,
        "sessionId": "amzn1.echo-api.session.0000000-0000-0000-0000-00000000000",
        "application": {
          "applicationId": "amzn1.echo-sdk-ams.app.000000-d0ed-0000-ad00-000000d00ebe"
        },
        "attributes": {},
        "user": {
          "userId": "amzn1.account.AM3B00000000000000000000000"
        }
      },
      "request": {
        "type": "IntentRequest",
        "requestId": "amzn1.echo-api.request.0000000-0000-0000-0000-00000000000",
        "intent": {
          "name": "SayHelloIntent",
          "slots": {}
        },
        "locale": "en-US",
        "timestamp": "2018-01-24T13:34:25Z"
      },
      "context": {
        "AudioPlayer": {
          "playerActivity": "IDLE"
        },
        "System": {
          "application": {
            "applicationId": "amzn1.echo-sdk-ams.app.000000-d0ed-0000-ad00-000000d00ebe"
          },
          "user": {
            "userId": "amzn1.account.AM3B00000000000000000000000"
          },
          "device": {
            "supportedInterfaces": {}
          }
        }
      },
      "version": "1.0"
    }
  end

  it "#say_hello" do
    post :say_hello, payload.to_json, headers
    expect(JSON.parse(response.body)).to eq(
      {"version"=>"1.0",
        "sessionAttributes"=>{},
        "response"=>
        {"shouldEndSession"=>true,
          "outputSpeech"=>{"type"=>"PlainText", "text"=>"You are awesome!"},
          "reprompt"=>
          {"outputSpeech"=>
            {"type"=>"SSML", "ssml"=>"<speak>You are awesome!</speak>"}}}}
    )
  end
end
