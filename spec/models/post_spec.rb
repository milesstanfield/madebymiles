require "spec_helper.rb"

describe Post do
  it "has string attributes" do
    ["title", "use", "body", "slug"].each do |attribute|
      record = described_class.new
      record.send("#{attribute}=", "some string")
      expect(record.send("#{attribute}")).to eq "some string"
    end
  end

  it "has many tags" do
    post = Post.new
    expect(post.tags).to be_empty
  end

  it "creates friendly id slug from title with date prepended" do
    post = Post.create(title: "This is my #title")
    expect(["/posts/#{slug_date_portion1}/this-is-my-title",
      "/posts/#{slug_date_portion2}/this-is-my-title", "/posts/#{slug_date_portion3}/this-is-my-title"].any? do |slug|
        post.slug == slug
      end).to eq true
  end

  it "gets only blog posts" do
    blog_post = Post.create(title: "This is my blog post", use: "blog")
    tutorial_post = Post.create(title: "This is my howto post", use: "tutorial")
    expect(Post.blogs.count).to eq 1
    expect(Post.blogs.first.title).to eq "This is my blog post"
  end

  it "gets only tutorial posts" do
    tutorial_post = Post.create(title: "This is my tutorial post", use: "tutorial")
    blog_post = Post.create(title: "This is my blog post", use: "blog")
    expect(Post.tutorials.count).to eq 1
    expect(Post.tutorials.first.title).to eq "This is my tutorial post"
  end

  it "sorts posts and returns them in recent (created_at) order" do
    Post.create(title: "oldest", created_at: Time.now - 10.minutes)
    Post.create(title: "new", created_at: Time.now)
    Post.create(title: "older", created_at: Time.now - 5.minutes)
    expect(Post.recent.map(&:title)).to eq ["new", "older", "oldest"]
  end
end