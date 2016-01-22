class PortfoliosController < ApplicationController
  before_action :load_settings

  def index
    page = Page.by_name_or_create "portfolio"
    @active_nav_tab = page.active_nav_tab
    @title_tag = page.title_tag
    @meta_tags = page.meta_tags
    @portfolios = Portfolio.recent.limit(25)
  end

  def show
    @portfolios = Portfolio.recent.limit(2)
    portfolio = Portfolio.find_by_slug params[:slug]
    @presented_portfolio = PortfolioPresenter.new portfolio
    @active_nav_tab = "portfolio"
    @title_tag = @presented_portfolio.title
    @meta_tags = []
  end

  def roles
    @title_tag = "#{params[:role]} portfolio"
    @active_nav_tab = "portfolio"
    @portfolios = Portfolio.by_role(params[:role])
    @meta_tags = []
    render "index"
  end
end
