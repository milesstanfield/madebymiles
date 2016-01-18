require "spec_helper"

describe ApplicationController, type: :controller do
  shadow_controller

  before do
    FeatureFlipper.create name: "404", active: true
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