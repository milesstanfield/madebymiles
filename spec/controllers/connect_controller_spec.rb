require "spec_helper"

describe ConnectController, type: :controller do
  it "#index" do
    get :index
    expect(response).to render_template :index
  end
end