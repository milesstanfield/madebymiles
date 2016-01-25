require "spec_helper"

describe TagHelpers, type: :helper do
  it ".inline_link" do
    inline_link = "<a target=\"_blank\" class=\"m-bold m-medium m-color-blue a-inline-link-hover\" href=\"/\">link</a>"
    expect(inline_link("link", "/", target: "_blank")).to eq inline_link
  end

  it ".custom_link" do
    custom_link = "<a href='/' class='m-bold m-medium m-color-blue a-inline-link-hover'>link</a>"
    expect(custom_link("link", "/")).to eq custom_link
  end

  it ".meta_tag" do
    meta_tag_record = MetaTag.create tag_type: "meta", attr: "name", attr_value: "miles", content: "foo"
    meta_tag_style = "<meta name='miles' content='foo'></meta>"
    expect(meta_tag(meta_tag_record)).to eq meta_tag_style
  end

  it ".quote_tag" do
    quote_tag = "<p class='l-medium-padding m-bg-quote'>quote</p>"
    expect(quote_tag("foo")).to eq quote_tag
  end

  it ".full_image" do
    image_style = "<img src='http://www.google.com/test.png' alt='alt' class='l-width-100'"
    expect(full_image("http://www.google.com/test.png", "alt")).to eq image_style
  end
end
