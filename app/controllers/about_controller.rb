class AboutController < ApplicationController
  before_action :load_settings

  def index
    page = Page.by_name_or_create "about"
    @active_nav_tab = page.active_nav_tab
    @title_tag = page.title_tag
    @meta_tags = page.meta_tags
    @this_year = Time.now.year
  end
end
