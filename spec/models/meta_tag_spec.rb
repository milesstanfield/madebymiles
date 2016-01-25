require "spec_helper"

describe MetaTag do
  it "has string attributes" do
    string_attributes_expectations "attr", "attr_value", "content", "tag_type"
  end

  it "has many pages" do
    expect(MetaTag.create(attr: "foo").pages).to eq []
  end

  it "must have attr, attr_value and content" do
    MetaTag.create attr: "name"
    expect(MetaTag.count).to eq 0
    MetaTag.create attr: "name", attr_value: "miles"
    expect(MetaTag.count).to eq 0
    MetaTag.create attr: "name", attr_value: "miles", content: "foo"
    expect(MetaTag.count).to eq 1
  end
end