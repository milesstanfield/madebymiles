class PortfoliosController < ApplicationController
  before_action :load_settings

  def index
    page = Page.by_name_or_create "portfolio"
    @active_nav_tab = page.active_nav_tab
    @title_tag = page.title_tag
    @meta_tags = page.meta_tags
  end

  def show
    @portfolio = Portfolio.find_by_slug params[:slug]
    @active_nav_tab = "portfolio"
    @title_tag = @portfolio.title
    @meta_tags = []
  end
end
