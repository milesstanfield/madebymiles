require "spec_helper"

describe Portfolio do
  it "has string/text attributes" do
    string_attributes_expectations "title", "teaser", "body", "slug"
  end

  it "has and belongs to many roles" do
    portfolio1 = FactoryGirl.create :portfolio
    portfolio2 = FactoryGirl.create :portfolio
    role = FactoryGirl.create :role
    portfolio1.roles << role
    expect(portfolio1.roles.first).to eq role
    portfolio2.roles << role
    expect(portfolio2.roles.first).to eq role
    expect(portfolio1.roles.first).to eq role
  end

  it "has many images" do
    portfolio = FactoryGirl.create :portfolio
    expect(portfolio.images).to eq []
  end

  it "creates friendly id slug from title with date prepended" do
    portfolio = FactoryGirl.create :portfolio, title: "This is my #title"
    expect(portfolio.slug). to eq "#{slug_date_portion1}/this-is-my-title"
  end

  it ".path" do
    portfolio = FactoryGirl.create(:portfolio, title: "foo")
    expect(portfolio.path).to eq "/portfolios/#{portfolio.slug}"
  end

  it ".cover_image_url" do
    portfolio = FactoryGirl.create :portfolio
    file = Rack::Test::UploadedFile.new(test_image_path)
    cover_image = CoverImage.create(file: file)
    portfolio.cover_images << cover_image
    expect(portfolio.cover_image_url).to include "test-image-file-google.jpg"
  end

  it "can't make more than 300 cc teaser" do
    teaser = "x" * 301
    expect {FactoryGirl.create :portfolio, teaser: teaser}.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "has timestamps" do
    portfolio = Portfolio.new
    portfolio.created_at = "2016-01-19 12:51:54 -0500"
    portfolio.updated_at = "2016-01-19 12:51:54 -0500"
    expect(portfolio.created_at).to eq "2016-01-19 12:51:54 -0500"
    expect(portfolio.updated_at).to eq "2016-01-19 12:51:54 -0500"
  end

  it ".recent" do
    FactoryGirl.create :portfolio, title: "oldest", created_at: (Time.now - 10.minutes)
    FactoryGirl.create :portfolio, title: "new", created_at: Time.now
    FactoryGirl.create :portfolio, title: "older", created_at: (Time.now - 5.minutes)
    expect(Portfolio.recent.map(&:title)).to eq ["new", "older", "oldest"]
  end

  it ".by_role" do
    p1 = FactoryGirl.create :portfolio, title: "p1"
    p2 = FactoryGirl.create :portfolio, title: "p2"
    p1.roles << (FactoryGirl.create :role, title: "designer")
    expect(Portfolio.by_role("designer").count).to eq 1
    expect(Portfolio.by_role("designer").first).to eq p1
  end
end