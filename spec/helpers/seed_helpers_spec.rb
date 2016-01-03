require "spec_helper"

describe SeedHelpers, type: :helper do
  it ".create_activate_flippers" do
    expect(FeatureFlipper.count).to eq 0
    create_activate_flippers
    expect(FeatureFlipper.count).to eq 7
  end

  it ".create_posts_and_tags(use)" do
    expect(Post.count).to eq 0
    expect(Tag.count).to eq 0
    create_posts_and_tags "blog"
    expect(Post.count).to eq 7
    expect(Tag.count).to eq 7
    expect(Post.all.map(&:use).uniq).to eq ["blog"]
  end

  it ".create_admin_user" do
    expect(User.count).to eq 0
    create_admin_user
    expect(User.count).to eq 1
    expect(User.first.email).to eq "admin@example.com"
  end

  it ".create_pages_and_associated" do
    expect(Page.count).to eq 0
    expect(FeatureFlipper.count).to eq 0
    expect(MetaTag.count).to eq 0

    # create records
    create_pages_and_associated

    expect(Page.count).to eq 9
    expect(FeatureFlipper.count).to eq 7
    expect(MetaTag.count).to eq 9
  end
end
