require "spec_helper"

describe Portfolio do
  it "has string/text attributes" do
    ["title", "teaser", "body"].each do |attribute|
      record = described_class.new
      record.send("#{attribute}=", "some string")
      expect(record.send("#{attribute}")).to eq "some string"
    end
  end

  it "has many images" do
    FactoryGirl.create :portfolio
    expect(Portfolio.first.images).to eq []
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

  it "has images" do
    image_file = Rack::Test::UploadedFile.new(test_image_path)
    image = Image.new(file: image_file)
    expect(image.save).to be_truthy
    expect(image.reload.file.length).to be > 0
  end
end