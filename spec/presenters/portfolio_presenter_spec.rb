require "spec_helper"

describe PortfolioPresenter do
  let(:portfolio){ FactoryGirl.create :portfolio, body: "this is an example \n\n > this is a quote" }

  it ".markdown_body" do
    body = PortfolioPresenter.new(portfolio).markdown_body
    expect(body).to eq "<p>this is an example </p>\n<p class='l-medium-padding m-bg-quote'>quote</p>"
  end
end