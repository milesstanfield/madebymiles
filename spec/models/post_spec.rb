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
    expect(post.slug).to eq "/posts/#{slug_date_portion}/this-is-my-title"
  end
end