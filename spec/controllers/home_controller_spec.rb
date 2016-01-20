require "spec_helper"

describe HomeController, type: :controller do
  it "#index" do
    recent_portfolios = double(:recent_portfolios)
    page = double(:page, name: "home", active_nav_tab: "home", title_tag: "home", meta_tags: [])
    expect(Page).to receive(:find_by_name).with(page.name).and_return(page)
    expect(page).to receive(:active_nav_tab).and_return(page.active_nav_tab)
    expect(page).to receive(:title_tag).and_return(page.title_tag)
    expect(page).to receive(:meta_tags).and_return(page.meta_tags)
    blog_posts = double(:blog_posts)
    expect(Post).to receive(:blog).and_return(blog_posts)
    expect(blog_posts).to receive(:recent).and_return(blog_posts)
    expect(blog_posts).to receive(:limit).with(6).and_return(blog_posts)
    tutorial_posts = double(:tutorial_posts)
    expect(Post).to receive(:tutorials).and_return(tutorial_posts)
    expect(tutorial_posts).to receive(:recent).and_return(tutorial_posts)
    expect(tutorial_posts).to receive(:limit).with(6).and_return(tutorial_posts)
    expect(Setting).to receive(:first_or_create).and_return(double(:setting))
    expect(Portfolio).to receive(:recent).and_return(recent_portfolios)
    expect(recent_portfolios).to receive(:limit).with(4).and_return(recent_portfolios)
    get :index
    expect(response).to render_template(:index)
    expect(assigns(:active_nav_tab)).to eq "home"
    expect(assigns(:title_tag)).to eq "home"
    expect(assigns(:meta_tags)).to eq []
    expect(assigns(:blog_posts)).to eq blog_posts
    expect(assigns(:tutorial_posts)).to eq tutorial_posts
    expect(assigns(:portfolios)).to eq recent_portfolios
  end
end
