require "spec_helper"

describe PortfolioController, type: :controller do
  it "#index" do
    get :index
    expect(assigns(:active_nav_tab)).to eq "portfolio"
    expect(assigns(:title_tag)).to eq "portfolio"
    expect(response).to render_template :index
  end
end