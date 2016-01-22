require "spec_helper"

describe PostsController, type: :controller do
  it "#taggged" do
    posts_by_tag = double(:posts_by_tag)
    expect(Post).to receive(:by_tag_name).with("rspec").and_return(posts_by_tag)
    expect(posts_by_tag).to receive(:limit).with(25).and_return(posts_by_tag)
    expect(Setting).to receive(:first_or_create).and_return(double(:setting))
    get :tagged, tag_name: "rspec"
    expect(response).to render_template :tagged
    expect(assigns(:posts)).to eq(posts_by_tag)
    expect(assigns(:title_tag)).to eq "rspec posts"
    expect(assigns(:meta_tags)).to eq []
  end

  it "#blog" do
    page = double(:page, name: "blog", active_nav_tab: "blog", title_tag: "blog", meta_tags: [])
    expect(Page).to receive(:find_by_name).with(page.name).and_return(page)
    expect(page).to receive(:active_nav_tab).and_return(page.active_nav_tab)
    expect(page).to receive(:title_tag).and_return(page.title_tag)
    expect(page).to receive(:meta_tags).and_return(page.meta_tags)
    blog_posts = double(:blog_posts)
    expect(Post).to receive(:blog).and_return(blog_posts)
    expect(blog_posts).to receive(:limit).with(25).and_return(blog_posts)
    expect(Setting).to receive(:first_or_create).and_return(double(:setting))
    get :blog
    expect(response).to render_template :blog
    expect(assigns(:active_nav_tab)).to eq "blog"
    expect(assigns(:posts)).to eq blog_posts
    expect(assigns(:title_tag)).to eq "blog"
    expect(assigns(:meta_tags)).to eq []
  end

  it "#tutorials" do
    page = double(:page, name: "tutorials", active_nav_tab: "tutorials", title_tag: "tutorials", meta_tags: [])
    expect(Page).to receive(:find_by_name).with(page.name).and_return(page)
    expect(page).to receive(:active_nav_tab).and_return(page.active_nav_tab)
    expect(page).to receive(:title_tag).and_return(page.title_tag)
    expect(page).to receive(:meta_tags).and_return(page.meta_tags)
    tutorial_posts = double(:tutorial_posts)
    expect(Post).to receive(:tutorials).and_return(tutorial_posts)
    expect(tutorial_posts).to receive(:limit).with(25).and_return(tutorial_posts)
    expect(Setting).to receive(:first_or_create).and_return(double(:setting))
    get :tutorials
    expect(response).to render_template :tutorials
    expect(assigns(:active_nav_tab)).to eq "tutorials"
    expect(assigns(:posts)).to eq tutorial_posts
    expect(assigns(:title_tag)).to eq "tutorials"
    expect(assigns(:meta_tags)).to eq []
  end

  it "#show" do
    post = double(:post)
    slug = "2015/12/19/how-to-do-foobar"
    use = "blog"
    title = "How to do foobar"
    presented_post = double(:presented_post, use: use, title: title)
    expect(Post).to receive(:find_by_slug).with(slug).and_return(post)
    expect(PostPresenter).to receive(:new).with(post).and_return(presented_post)
    expect(presented_post).to receive(:use).and_return(use)
    expect(presented_post).to receive(:title).and_return(title)
    expect(Setting).to receive(:first_or_create).and_return(double(:setting))
    get :show, slug: slug
    expect(response).to render_template :show
    expect(assigns(:presented_post)).to eq presented_post
    expect(assigns(:active_nav_tab)).to eq use
    expect(assigns(:title_tag)).to eq title
    expect(assigns(:meta_tags)).to eq []
  end
end
