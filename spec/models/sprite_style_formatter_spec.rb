require 'spec_helper'

xdescribe SpriteStyleFormatter do

  let(:options){ OpenStruct.new(test_options) }
  let(:formatted_style){ SpriteStyleFormatter.new(options).format(sample_images) }

  it "imports other scss files" do
    expect(formatted_style.include? "@import 'mixins';\n@import 'variables';").to eq true
  end

  it "one lines main styling" do
    expect(formatted_style.include? "\nimg.adchoices_logo { width: 12px; height: 12px; background-position: 0px -39px; }\n").to eq true
  end

  it "assigns correct width, height and background positions for sprite styles" do
    expect(formatted_style.include? ".adchoices_logo { width: 12px; height: 12px; background-position: 0px -39px; }").to eq true
  end

  it "assigns a hook to later resize background for sprites_2x images" do
    expect(formatted_style.include? "background-size: REPLACE_WITH_SPRITE_PNG_WIDTH REPLACE_WITH_SPRITE_PNG_HEIGHT").to eq true
  end

  it "allows custom class naming" do
    expect(formatted_style.include? ".m-hamburger-close-default {").to eq true
  end

  it "defaults selector to img unless specified" do
    expect(formatted_style.include? "img.adchoices_logo {").to eq true
  end

  it "styles desired classes with retina and standard styles with one line selector" do
    expect(formatted_style.include? ".adchoices_logo, .m-hamburger-close-default {").to eq true
  end

  it "uses sprites.png for asset path location for standard images" do
    expect(formatted_style.include? "img.adchoices_logo, .m-hamburger-close-default {\n        background-repeat: no-repeat;\n        background-image: url(image_path('sprites.png'));").to eq true
  end

  it "uses sprites_2x.png for asset path location for retina display devices" do
    expect(formatted_style.include? "(min-device-pixel-ratio: 1.5) {\n          background-image: url(image_path('sprites_2x.png'));\n").to eq true
  end

  def sample_images
    {:adchoices_logo=>
      {:filename=>"app/assets/images/sprites/adchoices_logo.png",
       :image=>"app/assets/images/sprites/adchoices_logo.png PNG 12x12 12x12+0+0 DirectClass 8-bit 3kb",
       :width=>12,
       :height=>12,
       :name=>"adchoices_logo",
       :ext=>".png",
       :cssw=>12,
       :cssx=>0,
       :x=>0,
       :cssh=>12,
       :cssy=>39,
       :y=>39,
       :selector=>"img.",
       :style=>"width: 12px; height: 12px; background: url(image_path('sprites.png')) 0px -39px no-repeat"},
     :hamburger_close_grey=>
      {:filename=>"app/assets/images/sprites/hamburger_close_grey.png",
       :image=>"app/assets/images/sprites/hamburger_close_grey.png PNG 27x25 27x25+0+0 DirectClass 8-bit 3kb",
       :width=>27,
       :height=>25,
       :name=>"hamburger_close_grey",
       :ext=>".png",
       :cssw=>27,
       :cssx=>12,
       :x=>12,
       :cssh=>25,
       :cssy=>32,
       :y=>32,
       :selector=>"img.",
       :style=>"width: 27px; height: 25px; background: url(image_path('sprites.png')) -12px -32px no-repeat"},
     :hamburger_close_grey_small=>
      {:filename=>"app/assets/images/sprites/hamburger_close_grey_small.png",
       :image=>"app/assets/images/sprites/hamburger_close_grey_small.png PNG 22x20 22x20+0+0 DirectClass 8-bit 3kb",
       :width=>22,
       :height=>20,
       :name=>"hamburger_close_grey_small",
       :ext=>".png",
       :cssw=>22,
       :cssx=>39,
       :x=>39,
       :cssh=>20,
       :cssy=>35,
       :y=>35,
       :selector=>"img.",
       :style=>"width: 22px; height: 20px; background: url(image_path('sprites.png')) -39px -35px no-repeat"},
     }
   end

   def test_options
     {
       :sprite_stylesheet_path=>"app/assets/stylesheets/sprites.css.scss",
       :sprite_png_image_path=>"app/assets/images/sprites.png",
       :sprites_rails_helper=>"url(image_path('sprites.png'))",
       :retina_sprites_rails_helper=>"url(image_path('sprites_2x.png'))",
       :sprites_folder_path=>"app/assets/images/sprites/",
       :sprites_2x_folder_path=>"app/assets/images/sprites_2x/"
     }
   end
end
