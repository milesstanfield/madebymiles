require "spec_helper"

describe Image do
  let(:image_file){ Rack::Test::UploadedFile.new(test_image_path) }

  it "has a title" do
    string_attributes_expectations "title"
  end

  it "has a file" do
    image = Image.new(file: image_file, title: "test image")
    expect(image.save).to be_truthy
    expect(image.reload.file.length).to be > 0
  end

  it "has a unique title" do
    Image.create(file: image_file, title: "test image")
    expect(Image.count).to eq 1
    Image.create(file: image_file, title: "test image")
    expect(Image.count).to eq 1
  end
end
