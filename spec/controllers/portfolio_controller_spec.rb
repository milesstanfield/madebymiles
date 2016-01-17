require "spec_helper"

describe PortfolioController, type: :controller do
  it "#index" do
    page = double(:page, name: "portfolio", active_nav_tab: "portfolio", title_tag: "portfolio", meta_tags: [])
    expect(Page).to receive(:find_by_name).with(page.name).and_return(page)
    expect(page).to receive(:active_nav_tab).and_return(page.active_nav_tab)
    expect(page).to receive(:title_tag).and_return(page.title_tag)
    expect(page).to receive(:meta_tags).and_return(page.meta_tags)
    expect(Setting).to receive(:first_or_create).and_return(double(:setting))
    get :index
    expect(response).to render_template :index
    expect(assigns(:active_nav_tab)).to eq "portfolio"
    expect(assigns(:title_tag)).to eq "portfolio"
    expect(assigns(:meta_tags)).to eq []
  end
end