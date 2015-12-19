require "spec_helper"

describe PostsController, type: :controller do
  it "#tags" do
    posts_by_tag = double(:posts_by_tag)
    expect(Post).to receive(:by_tag_name).with("rspec").and_return(posts_by_tag)
    expect(posts_by_tag).to receive(:limit).with(25).and_return(posts_by_tag)
    get :tagged, tag_name: "rspec"
    expect(assigns(:posts)).to eq(posts_by_tag)
    expect(response).to render_template :tagged
  end

  it "#blog" do
    blog_posts = double(:blog_posts)
    expect(Post).to receive(:blog).and_return(blog_posts)
    expect(blog_posts).to receive(:limit).with(25).and_return(blog_posts)
    get :blog
    expect(assigns(:posts)).to eq blog_posts
    expect(response).to render_template :blog
  end

  it "#tutorials" do
    tutorial_posts = double(:tutorial_posts)
    expect(Post).to receive(:tutorials).and_return(tutorial_posts)
    expect(tutorial_posts).to receive(:limit).with(25).and_return(tutorial_posts)
    get :tutorials
    expect(assigns(:posts)).to eq tutorial_posts
    expect(response).to render_template :tutorials
  end

  it "#show" do
    post = double(:post)
    slug = "2015/12/19/how-to-do-foobar"
    expect(Post).to receive(:find_by_slug).with(slug).and_return(post)
    get :show, slug: slug
    expect(assigns(:post)).to eq post
    expect(response).to render_template :show
  end
end