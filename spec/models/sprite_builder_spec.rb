require 'spec_helper'

xdescribe SpriteBuilder do

  let(:sprite_builder){ SpriteBuilder.new(test_options) }

  after do
    remove_test_files
  end

  context "tests" do
    before(:each) do
      remove_test_files
      system "mkdir tmp/test"
      system "mkdir tmp/test/assets"
      system "mkdir tmp/test/assets/stylesheets"
      system "mkdir tmp/test/assets/images"
      system "mkdir tmp/test/assets/images/sprites"
      system "mkdir tmp/test/assets/images/sprites_2x"
      system "cp app/assets/images/sprites/twitter_connect.png tmp/test/assets/images/sprites/twitter_connect.png"
      system "cp app/assets/images/sprites_2x/adchoices_logo.png tmp/test/assets/images/sprites_2x/adchoices_logo.png"
      system "cp app/assets/images/sprites_2x/quote_right.png tmp/test/assets/images/sprites_2x/quote_right.png"
    end

    it "removes previously saved images from the sprites/ folder" do
      expect(File).to exist("#{Rails.root}/tmp/test/assets/images/sprites/twitter_connect.png")
      sprite_builder.build
      expect(File).not_to exist("#{Rails.root}/tmp/test/assets/images/sprites/twitter_connect.png")
    end

    it "generate_regular_size_sprite_images" do
      expect(File).not_to exist("#{Rails.root}/tmp/test/assets/images/sprites/adchoices_logo.png")
      expect(File).not_to exist("#{Rails.root}/tmp/test/assets/images/sprites/quote_right.png")
      sprite_builder.build
      expect(File).to exist("#{Rails.root}/tmp/test/assets/images/sprites/adchoices_logo.png")
      expect(File).to exist("#{Rails.root}/tmp/test/assets/images/sprites/quote_right.png")
    end

    it "generate_styles_and_sprite_pngs" do
      expect(File).not_to exist("#{Rails.root}/tmp/test/assets/stylesheets/sprites.css.scss")
      expect(File).not_to exist("#{Rails.root}/tmp/test/assets/images/sprites.png")
      expect(File).not_to exist("#{Rails.root}/tmp/test/assets/images/sprites_2x.png")
      sprite_builder.build
      expect(File).to exist("#{Rails.root}/tmp/test/assets/stylesheets/sprites.css.scss")
      expect(File).to exist("#{Rails.root}/tmp/test/assets/images/sprites.png")
      expect(File).to exist("#{Rails.root}/tmp/test/assets/images/sprites_2x.png")
    end

    it "update_retina_background_size_in_stylesheet" do
      sprite_builder.build
      stylesheet = IO.read("#{Rails.root}/tmp/test/assets/stylesheets/sprites.css.scss")
      sprite_png_width = sprite_builder.send("image_width", "#{Rails.root}/tmp/test/assets/images/sprites.png")
      sprite_png_height = sprite_builder.send("image_height", "#{Rails.root}/tmp/test/assets/images/sprites.png")
      expect(stylesheet.include? "background-size: #{sprite_png_width}px #{sprite_png_height}px;")
    end

    def test_options
     {
       :sprite_stylesheet_path=>"tmp/test/assets/stylesheets/sprites.css.scss",
       :sprite_png_image_path=>"tmp/test/assets/images/sprites.png",
       :sprites_rails_helper=>"url(image_path('sprites.png'))",
       :retina_sprites_rails_helper=>"url(image_path('sprites_2x.png'))",
       :sprites_folder_path=>"tmp/test/assets/images/sprites/",
       :sprites_2x_folder_path=>"tmp/test/assets/images/sprites_2x/"
     }
    end
  end

  def remove_test_files
   system "rm -rf tmp/test"
  end
end
