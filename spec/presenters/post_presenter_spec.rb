require "spec_helper"

describe PostPresenter do
  let(:post){ FactoryGirl.create :post, body: "this is an example \n\n > this is a quote" }

  it ".markdown_body" do
    body = PostPresenter.new(post).markdown_body
    expect(body).to eq "<p>this is an example </p>\n<p class='l-medium-padding m-bg-quote'>quote</p>"
  end
end