class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper TitleHelper
  helper NavigationHelper

  def missing_page
    render 'layouts/missing_page', status: 404
  end
end
