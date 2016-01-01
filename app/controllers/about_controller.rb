class AboutController < ApplicationController
  def index
    @active_nav_tab = "about"
    @title_tag = "about"
  end
end
