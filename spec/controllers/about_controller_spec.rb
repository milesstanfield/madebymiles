require "spec_helper"

describe AboutController, type: :controller do
  it "#index" do
    get :index
    expect(assigns(:active_nav_tab)).to eq "about"
    expect(response).to render_template :index
  end
end