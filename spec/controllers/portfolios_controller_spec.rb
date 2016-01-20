require "spec_helper"

describe PortfoliosController, type: :controller do
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

  it "#show" do
    portfolio = double(:portfolio, title: "Google Trends")
    slug = "2015/12/19/google-trends"
    expect(Portfolio).to receive(:find_by_slug).with(slug).and_return(portfolio)
    get :show, slug: slug
    expect(response).to render_template :show
    expect(assigns(:portfolio)).to eq portfolio
    expect(assigns(:title_tag)).to eq portfolio.title
    expect(assigns(:meta_tags)).to eq []
  end
end