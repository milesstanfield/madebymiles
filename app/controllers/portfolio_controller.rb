class PortfolioController < ApplicationController
  def index
    page = Page.by_name_or_create "portfolio"
    @active_nav_tab = page.active_nav_tab
    @title_tag = page.title_tag
  end
end
