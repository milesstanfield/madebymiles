require "spec_helper"

describe SearchController, type: :controller do
  it "#index" do
    get :index
    expect(response).to render_template :index
    expect(assigns(:meta_tags)).to eq []
  end
end
