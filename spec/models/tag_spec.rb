require "spec_helper"

describe Tag do
  it "has string attributes" do
    ["name"].each do |attribute|
      record = described_class.new
      record.send("#{attribute}=", "some string")
      expect(record.send("#{attribute}")).to eq "some string"
    end
  end

  it "belongs to many posts" do
    tag = Tag.create(name: "foo")
    blog_post = FactoryGirl.create(:post, use: "blog")
    tutorial_post = FactoryGirl.create(:post, use: "tutorial")
    blog_post.tags << tag
    tutorial_post.tags << tag
    expect(blog_post.tags.count).to eq 1
    expect(blog_post.tags.first).to eq tag
    expect(tutorial_post.tags.count).to eq 1
    expect(tutorial_post.tags.first).to eq tag
  end

  it "does not create a duplicate named tag (unique)" do
    Tag.create(name: "foo")
    expect(Tag.count).to eq 1
    Tag.create(name: "foo")
    expect(Tag.count).to eq 1
  end
end
