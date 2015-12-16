require "spec_helper"

describe PostsController, type: :controller do
  it "#tags" do
    posts_by_tag = double(:posts_by_tag)
    expect(Post).to receive(:by_tag_name).with("rspec").and_return(posts_by_tag)
    expect(posts_by_tag).to receive(:limit).with(25).and_return(posts_by_tag)
    get :tagged, tag_name: "rspec"
    expect(assigns(:posts_by_tags)).to eq(posts_by_tag)
    expect(response).to render_template :tagged
  end
end