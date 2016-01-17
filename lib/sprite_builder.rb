class SpriteBuilder
  require 'rmagick'
  require 'sprite_factory'
  require 'sprite_style_formatter'
  attr_reader :options

  def initialize(options = default_options)
    @options = OpenStruct.new(options)
    @sprite_style_formatter = SpriteStyleFormatter.new(@options)
  end

  def build
    remove_regular_sized_sprite_images
    generate_regular_size_sprite_images
    generate_styles_and_sprite_pngs
    update_retina_background_size_in_stylesheet
  end

  private

  def default_options
    {
      sprite_stylesheet_path: "app/assets/stylesheets/sprites.css.scss",
      sprite_png_image_path: "app/assets/images/sprites.png",
      sprites_rails_helper: "url(image_path('sprites.png'))",
      retina_sprites_rails_helper: "url(image_path('sprites_2x.png'))",
      sprites_folder_path: "app/assets/images/sprites/",
      sprites_2x_folder_path: "app/assets/images/sprites_2x/"
    }
  end

  def image(filepath)
    Magick::Image.read(filepath).first
  end

  def image_height(filepath)
    image(filepath).rows
  end

  def image_width(filepath)
    image(filepath).columns
  end

  def remove_regular_sized_sprite_images
    FileUtils.rm_rf Dir.glob("#{options.sprites_folder_path}*")
  end

  def update_retina_background_size_in_stylesheet
    file_text = IO.read(options.sprite_stylesheet_path)
    file_text.gsub!("REPLACE_WITH_SPRITE_PNG_WIDTH", "#{image_width(options.sprite_png_image_path)}px")
    file_text.gsub!("REPLACE_WITH_SPRITE_PNG_HEIGHT", "#{image_height(options.sprite_png_image_path)}px")
    File.open(options.sprite_stylesheet_path, "w") {|file| file.puts file_text }
  end

  def generate_regular_size_sprite_images
    Dir.glob("#{options.sprites_2x_folder_path}*").each do |retina_image_path|
      resized_image = image(retina_image_path).scale(0.5)
      resized_image.write retina_image_path.gsub(options.sprites_2x_folder_path, options.sprites_folder_path)
    end
  end

  def generate_styles_and_sprite_pngs
    SpriteFactory.cssurl = "url(image_path('$IMAGE'))"
    SpriteFactory.run!(options.sprites_folder_path, output_style: options.sprite_stylesheet_path, nocomments: true) do |images|
      @sprite_style_formatter.format(images)
    end
    SpriteFactory.run!(options.sprites_2x_folder_path, nocss: true)
  end
end
