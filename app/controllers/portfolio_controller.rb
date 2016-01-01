class PortfolioController < ApplicationController
  def index
    @active_nav_tab = "portfolio"
    @title_tag = "portfolio"
  end
end
