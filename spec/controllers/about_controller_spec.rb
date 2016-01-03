require "spec_helper"

describe AboutController, type: :controller do
  it "#index" do
    page = double(:page, name: "about", active_nav_tab: "about", title_tag: "about")
    expect(Page).to receive(:find_by_name).with(page.name).and_return(page)
    expect(page).to receive(:active_nav_tab).and_return(page.active_nav_tab)
    expect(page).to receive(:title_tag).and_return(page.title_tag)
    get :index
    expect(assigns(:active_nav_tab)).to eq "about"
    expect(assigns(:title_tag)).to eq "about"
    expect(response).to render_template :index
  end
end