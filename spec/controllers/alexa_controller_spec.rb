require "spec_helper"

describe AlexaController, type: :controller do
  let(:headers) do
    {
      'HTTPS' => 'on',
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }
  end

  let(:say_hello_payload) do
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

  context 'when intent name is SayHelloIntent' do
    it "says hello" do
      post :home, say_hello_payload.to_json, headers
      expect(JSON.parse(response.body)).to eq(
        {
          "version"=>"1.0",
          "sessionAttributes"=>{},
          "response"=>{
            "shouldEndSession"=>true, "outputSpeech"=>{"type"=>"PlainText", "text"=>'hello miles!'}
          }
        }
      )
    end
  end

  context 'when intent name is SayGoodbyeIntent' do
    let(:payload) do
      p = say_hello_payload
      p[:request][:intent][:name] = 'SayGoodbyeIntent'
      p
    end

    it "says hello" do
      post :home, payload.to_json, headers
      expect(JSON.parse(response.body)).to eq(
        {
          "version"=>"1.0",
          "sessionAttributes"=>{},
          "response"=>{
            "shouldEndSession"=>true, "outputSpeech"=>{"type"=>"PlainText", "text"=>'goodbye miles!'}
          }
        }
      )
    end
  end
end
