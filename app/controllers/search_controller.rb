class SearchController < ApplicationController
  before_action :load_settings

  def index
    @meta_tags = []
  end
end
