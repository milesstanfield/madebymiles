require "spec_helper"

describe AlexaController, type: :controller do
  it "#say_hello" do
    get :say_hello
    expect(JSON.parse(response.body)).to eq({"foo"=>"bar"})
  end
end
