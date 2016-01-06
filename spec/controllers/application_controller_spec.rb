require "spec_helper"

describe ApplicationController, type: :controller do
  controller do
    def missing_page
      page = Page.by_name_or_create "404"
      @active_nav_tab = page.active_nav_tab
      @title_tag = page.title_tag
      @meta_tags = page.meta_tags
      render 'layouts/missing_page', status: 404
    end
  end

  before do
    routes.draw { get '/anonymous/missing_page' }
  end

  it "#missing_page" do
    page = double(:page, active_nav_tab: nil, title_tag: nil, meta_tags: [])
    expect(Page).to receive(:by_name_or_create).with("404").and_return(page)
    expect(page).to receive(:active_nav_tab).and_return nil
    expect(page).to receive(:title_tag).and_return nil
    expect(page).to receive(:meta_tags).and_return []
    get :missing_page
    expect(response).to render_template :missing_page
  end
end