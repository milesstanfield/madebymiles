class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper NavigationHelper
  helper TagHelpers

  def missing_page
    @title_tag = "404"
    render 'layouts/missing_page', status: 404
  end
end
