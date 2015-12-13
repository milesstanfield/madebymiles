require "spec_helper.rb"

describe Post do
  it "has string attributes" do
    ["title", "path", "use", "body"].each do |attribute|
      record = described_class.new
      record.send("#{attribute}=", "some string")
      expect(record.send("#{attribute}")).to eq "some string"
    end
  end

  it "has many tags" do
    post = Post.new
    expect(post.tags).to be_empty
  end
end