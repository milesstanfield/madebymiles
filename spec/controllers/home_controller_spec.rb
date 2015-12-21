require "spec_helper"

describe HomeController, type: :controller do

  it "#index" do
    blog_posts = double(:blog_posts)
    expect(Post).to receive(:blog).and_return(blog_posts)
    expect(blog_posts).to receive(:recent).and_return(blog_posts)
    expect(blog_posts).to receive(:limit).with(4).and_return(blog_posts)

    tutorial_posts = double(:tutorial_posts)
    expect(Post).to receive(:tutorials).and_return(tutorial_posts)
    expect(tutorial_posts).to receive(:recent).and_return(tutorial_posts)
    expect(tutorial_posts).to receive(:limit).with(4).and_return(tutorial_posts)

    get :index
    expect(response).to render_template(:index)
    expect(assigns(:active_nav_tab)).to eq "home"
    expect(assigns(:blog_posts)).to eq blog_posts
    expect(assigns(:tutorial_posts)).to eq tutorial_posts
  end
end