require "spec_helper"

describe Portfolio do
  it "has string/text attributes" do
    string_attributes_expectations "title", "teaser", "body"
  end

  it "has many images" do
    portfolio = FactoryGirl.create :portfolio
    expect(portfolio.images).to eq []
  end

  it ".cover_image" do
    portfolio = FactoryGirl.create :portfolio
    file = Rack::Test::UploadedFile.new(test_image_path)
    cover_image1 = CoverImage.create(file: file)
    cover_image2 = CoverImage.create(file: file)
    portfolio.cover_image = cover_image1
    portfolio.save
    portfolio.cover_image = cover_image2
    portfolio.save
    expect(portfolio.cover_images.count).to eq 1
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

  it "can save an image file" do
    image_file = Rack::Test::UploadedFile.new(test_image_path)
    image = Image.new(file: image_file)
    expect(image.save).to be_truthy
    expect(image.reload.file.length).to be > 0
  end
end