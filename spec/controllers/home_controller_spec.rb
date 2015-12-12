require "spec_helper.rb"
require "rails_helper.rb"

describe HomeController, type: :controller do

  it "#index" do
    get :index
    expect(response).to render_template(:index)
  end
end