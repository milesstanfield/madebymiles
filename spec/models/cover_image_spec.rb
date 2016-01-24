require "spec_helper"

describe CoverImage do
  let(:image_file){ Rack::Test::UploadedFile.new(test_image_path) }

  it "has string/text attributes" do
    string_attributes_expectations "title"
  end

  it "has a cover" do
    cover_image = CoverImage.new(file: image_file, title: "test image")
    expect(cover_image.save).to be_truthy
    expect(cover_image.reload.file.length).to be > 0
  end

  it "has a portfolio_id" do
    numerical_attributes_expectations "portfolio_id"
  end

  it "has a unique title" do
    CoverImage.create(file: image_file, title: "test image")
    expect(CoverImage.count).to eq 1
    CoverImage.create(file: image_file, title: "test image")
    expect(CoverImage.count).to eq 1
  end
end
