require "spec_helper"

describe ContactController, type: :controller do
  it "#index" do
    page = double(:page, name: "contact", active_nav_tab: "contact", title_tag: "contact", meta_tags: [])
    expect(Page).to receive(:find_by_name).with(page.name).and_return(page)
    expect(page).to receive(:active_nav_tab).and_return(page.active_nav_tab)
    expect(page).to receive(:title_tag).and_return(page.title_tag)
    expect(page).to receive(:meta_tags).and_return(page.meta_tags)
    get :index
    expect(assigns(:active_nav_tab)).to eq "contact"
    expect(assigns(:title_tag)).to eq "contact"
    expect(assigns(:meta_tags)).to eq []
    expect(response).to render_template :index
  end
end