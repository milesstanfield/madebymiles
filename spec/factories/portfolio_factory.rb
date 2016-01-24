FactoryGirl.define do
  factory :portfolio do
    title "title of portfolio"
    teaser "short description of portfolio"
    body "full information about this portfolio item"

    before :create do |portfolio|
      image_file = Rack::Test::UploadedFile.new(test_image_path)
      cover_image = CoverImage.create(file: image_file, title: portfolio.title)
      portfolio.cover_images << cover_image
    end
  end
end