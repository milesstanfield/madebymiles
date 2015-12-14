require "spec_helper.rb"

describe HomeController, type: :controller do

  it "#index" do
    blog_posts = double(:blog_posts)
    expect(Post).to receive(:blogs).and_return(blog_posts)
    expect(blog_posts).to receive(:recent).and_return(blog_posts)
    expect(blog_posts).to receive(:limit).with(6).and_return(blog_posts)
    get :index
    expect(response).to render_template(:index)
    expect(assigns(:blog_posts)).to eq(blog_posts)
  end
end