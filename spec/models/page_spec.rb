require "spec_helper"

describe Page do
  it "has string attributes" do
    string_attributes_expectations "name", "active_nav_tab", "title_tag"
  end

  it "has many feature_flippers" do
    expect(Page.create(name: "foo").feature_flippers).to eq []
  end

  it "has many meta tags" do
    expect(Page.create(name: "foo").meta_tags).to eq []
  end

  it "doesn't duplicate page names" do
    Page.create name: "foo"
    expect(Page.count).to eq 1
    Page.create name: "foo"
    expect(Page.count).to eq 1
  end

  it "must have a name" do
    Page.create active_nav_tab: "foo"
    expect(Page.count).to eq 0
  end

  it "gets by name or creates" do
    expect(Page.count).to eq 0
    Page.by_name_or_create "foo"
    expect(Page.count).to eq 1
    expect(Page.by_name_or_create("foo").name).to eq "foo"
  end
end
