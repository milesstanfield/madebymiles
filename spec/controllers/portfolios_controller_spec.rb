require "spec_helper"

describe PortfoliosController, type: :controller do
  it "#index" do
    recent_portfolios = double(:recent_portfolios)
    page = double(:page, name: "portfolio", active_nav_tab: "portfolio", title_tag: "portfolio", meta_tags: [])
    expect(Page).to receive(:find_by_name).with(page.name).and_return(page)
    expect(page).to receive(:active_nav_tab).and_return(page.active_nav_tab)
    expect(page).to receive(:title_tag).and_return(page.title_tag)
    expect(page).to receive(:meta_tags).and_return(page.meta_tags)
    expect(Setting).to receive(:first_or_create).and_return(double(:setting))
    expect(Portfolio).to receive(:recent).and_return(recent_portfolios)
    expect(recent_portfolios).to receive(:published).and_return(recent_portfolios)
    expect(recent_portfolios).to receive(:limit).with(25).and_return(recent_portfolios)
    get :index
    expect(response).to render_template :index
    expect(assigns(:active_nav_tab)).to eq "portfolio"
    expect(assigns(:title_tag)).to eq "portfolio"
    expect(assigns(:meta_tags)).to eq []
    expect(assigns(:portfolios)).to eq recent_portfolios
  end

  context "#show" do
    it "renders published portfolio" do
      portfolios = double(:portfolios)
      slug = "2015/12/19/google-trends"
      title = "Google Trends"
      portfolio = double(:portfolio, title: title, published: true)
      presented_portfolio = double(:presented_portfolio, title: title)
      expect(Portfolio).to receive(:recent).and_return(portfolios)
      expect(portfolios).to receive(:published).and_return(portfolios)
      expect(portfolios).to receive(:limit).with(3).and_return(portfolios)
      expect(Portfolio).to receive(:find_by_slug).with(slug).and_return(portfolio)
      expect(portfolio).to receive(:published?).and_return(true)
      expect(PortfolioPresenter).to receive(:new).with(portfolio).and_return(presented_portfolio)
      expect(presented_portfolio).to receive(:title).and_return(title)
      expect(Setting).to receive(:first_or_create).and_return(double(:setting))
      get :show, slug: slug
      expect(response).to render_template :show
      expect(assigns(:portfolios)).to eq portfolios
      expect(assigns(:presented_portfolio)).to eq presented_portfolio
      expect(assigns(:title_tag)).to eq portfolio.title
      expect(assigns(:meta_tags)).to eq []
    end
  end

  it "#roles" do
    portfolios = double(:portfolios)
    expect(Portfolio).to receive(:by_role).with("Designer").and_return(portfolios)
    expect(portfolios).to receive(:recent).and_return(portfolios)
    expect(portfolios).to receive(:published).and_return(portfolios)
    expect(portfolios).to receive(:limit).with(25).and_return(portfolios)
    expect(Setting).to receive(:first_or_create).and_return(double(:setting))
    get :roles, role: "Designer"
    expect(response).to render_template :index
    expect(assigns(:title_tag)).to eq "Designer portfolio"
    expect(assigns(:portfolios)).to eq portfolios
    expect(assigns(:meta_tags)).to eq []
    expect(assigns(:active_nav_tab)).to eq "portfolio"
  end
end