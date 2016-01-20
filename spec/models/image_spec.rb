require "spec_helper"

describe Image do
  it "has a title" do
    string_attributes_expectations "title"
  end

  it "has a file" do
    image_file = Rack::Test::UploadedFile.new(test_image_path)
    image = Image.new(file: image_file)
    expect(image.save).to be_truthy
    expect(image.reload.file.length).to be > 0
  end
end
