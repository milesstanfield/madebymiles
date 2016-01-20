def test_image_path(name = :google)
  test_image = "tmp/test-image-file-#{name}.jpg"
  images = {
    google: "https://s3.amazonaws.com/assets.madebymiles.com/uploads/google_bars.jpg"
  }
  unless File.exists?(test_image)
    `curl #{images[name]} -o #{test_image}`
  end
  "#{Rails.root}/#{test_image}"
end
