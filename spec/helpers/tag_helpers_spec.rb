require "spec_helper"

describe TagHelpers, type: :helper do
  it "has a styled inline_link helper" do
    styled_link = "<a target=\"_blank\" class=\"m-bold m-medium m-color-blue a-inline-link-hover\" href=\"/\">link</a>"
    expect(inline_link("link", "/", target: "_blank")).to eq styled_link
  end
end
