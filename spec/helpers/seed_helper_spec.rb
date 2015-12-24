require "spec_helper"

describe SeedHelper, type: :helper do
  it ".create_activate_flippers(*names)" do
    expect(FeatureFlipper.count).to eq 0
    create_activate_flippers("foo")
    expect(FeatureFlipper.count).to eq 1
    expect(FeatureFlipper.find_by_name("foo").active).to eq true
  end

  it ".create_posts_and_tags(use)" do
    expect(Post.count).to eq 0
    expect(Tag.count).to eq 0
    create_posts_and_tags "blog"
    expect(Post.count).to eq 7
    expect(Tag.count).to eq 7
    expect(Post.all.map(&:use).uniq).to eq ["blog"]
  end
end
