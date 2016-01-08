require "spec_helper"

describe PostPresenter do
  let(:post){ FactoryGirl.create :post, body: "this is an example \n\n > this is a quote" }
  let(:controller){ double(:controller, view_context: double(:view)) }

  it ".markdown_body" do
    body = PostPresenter.new(post, controller).markdown_body
    expect(body).to eq "<p>this is an example </p>\n\n<blockquote>\n<p>this is a quote</p>\n</blockquote>\n"
  end
end