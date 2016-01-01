require "spec_helper"

describe ConnectController, type: :controller do
  it "#index" do
    get :index
    expect(assigns(:active_nav_tab)).to eq "connect"
    expect(assigns(:title_tag)).to eq "connect"
    expect(response).to render_template :index
  end
end