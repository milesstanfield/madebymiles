require "spec_helper"

describe ConnectController, type: :controller do
  it "#index" do
    page = double(:page, name: "connect", active_nav_tab: "connect", title_tag: "connect")
    expect(Page).to receive(:find_by_name).with(page.name).and_return(page)
    expect(page).to receive(:active_nav_tab).and_return(page.active_nav_tab)
    expect(page).to receive(:title_tag).and_return(page.title_tag)
    get :index
    expect(assigns(:active_nav_tab)).to eq "connect"
    expect(assigns(:title_tag)).to eq "connect"
    expect(response).to render_template :index
  end
end