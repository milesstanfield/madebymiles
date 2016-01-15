class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper NavigationHelper
  helper TagHelpers

  # def missing_page
  #   if FeatureFlipper.active_names.include? "404"
  #     page = Page.by_name_or_create "404"
  #     @active_nav_tab = page.active_nav_tab
  #     @title_tag = page.title_tag
  #     @meta_tags = page.meta_tags
  #     render 'layouts/missing_page', status: 404
  #   end
  # end

  def foo
    render nothing: true
  end

  # def bar
  #   render nothing: true
  # end
end
