require "spec_helper"

describe Post do
  it "has string attributes" do
    string_attributes_expectations "title", "use", "body", "slug", "teaser"
  end

  it "has many images" do
    post = Post.new
    expect(post.images).to eq []
  end

  it "has many tags" do
    post = Post.new
    expect(post.tags).to eq []
  end

  it "creates friendly id slug from title with date prepended" do
    post = FactoryGirl.create :post, title: "This is my #title"
    expect(post.slug). to eq "#{slug_date_portion1}/this-is-my-title"
  end

  it "gets only blog posts" do
    blog_post = FactoryGirl.create(:post, title: "This is my blog post", use: "blog")
    tutorial_post = FactoryGirl.create(:post, title: "This is my howto post", use: "tutorial")
    expect(Post.blog.count).to eq 1
    expect(Post.blog.first.title).to eq "This is my blog post"
  end

  it "gets only tutorial posts" do
    tutorial_post = FactoryGirl.create :post, title: "This is my tutorial post", use: "tutorial"
    blog_post = FactoryGirl.create :post, title: "This is my blog post", use: "blog"
    expect(Post.tutorials.count).to eq 1
    expect(Post.tutorials.first.title).to eq "This is my tutorial post"
  end

  it "sorts posts and returns them in recent (created_at) order" do
    FactoryGirl.create :post, title: "oldest", created_at: (Time.now - 10.minutes)
    FactoryGirl.create :post, title: "new", created_at: Time.now
    FactoryGirl.create :post, title: "older", created_at: (Time.now - 5.minutes)
    expect(Post.recent.map(&:title)).to eq ["new", "older", "oldest"]
  end

  it "must have a title" do
    expect { FactoryGirl.create(:post, title: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "must have body" do
    expect { FactoryGirl.create(:post, body: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it ".path" do
    post = FactoryGirl.create(:post, title: "foo")
    expect(post.path).to eq "/posts/#{post.slug}"
  end

  context ".by_tag_name" do
    it "gets posts .by_tag_name" do
      post1 = FactoryGirl.create(:post, title: "1")
      post2 = FactoryGirl.create(:post, title: "2")
      rspec_tag = FactoryGirl.create(:tag, name: "rspec")
      git_tag = FactoryGirl.create(:tag, name: "git")

      post1.tags << rspec_tag
      post1.tags << git_tag
      post2.tags << git_tag

      expect(Post.by_tag_name("rspec").count).to eq 1
      expect(Post.by_tag_name("rspec").first).to eq post1
      expect(Post.by_tag_name("git").count).to eq 2
      expect(Post.by_tag_name("git").order("title").map(&:title)).to eq ["1", "2"]
    end

    it "returns empty array if no posts exists" do
      expect(Post.by_tag_name("rspec")).to eq []
    end
  end

  it ".available_uses" do
    expect(Post.available_uses).to eq ["blog", "tutorial"]
  end

  it "must have a use" do
    expect { FactoryGirl.create(:post, use: nil) }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "has a published attribute and is false by default" do
    FactoryGirl.create :post
    expect(Post.first.published).to eq false
  end

  it "has a published scope" do
    FactoryGirl.create :post, title: "f1"
    published_post = FactoryGirl.create :post, title: "f2", published: true
    expect(Post.published.count).to eq 1
    expect(Post.published.first).to eq published_post
  end
end
