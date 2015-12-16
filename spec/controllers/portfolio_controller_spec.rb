require "spec_helper"

describe PortfolioController, type: :controller do
  it "#index" do
    get :index
    expect(response).to render_template :index
  end
end