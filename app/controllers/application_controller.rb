class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def missing_page
    respond_to do |format|
      format.html { render 'layouts/missing_page', status: 404 }
    end
  end
end
