require "spec_helper"

describe CoverImage do
  it "has string/text attributes" do
    string_attributes_expectations "title"
  end

  it "has a cover" do
    image_file = Rack::Test::UploadedFile.new(test_image_path)
    cover_image = CoverImage.new(file: image_file)
    expect(cover_image.save).to be_truthy
    expect(cover_image.reload.file.length).to be > 0
  end

  it "has a portfolio_id" do
    numerical_attributes_expectations "portfolio_id"
  end
end
