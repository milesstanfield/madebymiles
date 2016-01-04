class AboutController < ApplicationController
  def index
    page = Page.by_name_or_create "about"
    @active_nav_tab = page.active_nav_tab
    @title_tag = page.title_tag
    @meta_tags = page.meta_tags
  end
end
