def test_image_path(name = :profile)
  test_image = "tmp/test-image-file-#{name}.png"
  images = {
    profile: "https://s3.amazonaws.com/assets.madebymiles.com/uploads/8116336.jpg"
  }
  unless File.exists?(test_image)
    `curl #{images[name]} -o #{test_image}`
  end
  "#{Rails.root}/#{test_image}"
end
